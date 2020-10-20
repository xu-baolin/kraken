/*
 * Copyright (C) 2020 Alibaba Inc. All rights reserved.
 * Author: Kraken Team.
 */

#include "js_context.h"
#include "bindings/jsc/macros.h"
#include <memory>

namespace kraken::binding::jsc {

JSContext::JSContext(int32_t contextId, const JSExceptionHandler &handler, void *owner)
  : contextId(contextId), _handler(handler), owner(owner), ctxInvalid_(false) {

  ctx_ = JSGlobalContextCreateInGroup(nullptr, nullptr);
  JSObjectRef global = JSContextGetGlobalObject(ctx_);
  JSStringRef windowName = JSStringCreateWithUTF8CString("window");
  JSStringRef globalThis = JSStringCreateWithUTF8CString("globalThis");
  JSObjectSetProperty(ctx_, global, windowName, global, kJSPropertyAttributeNone, nullptr);
  JSObjectSetProperty(ctx_, global, globalThis, global, kJSPropertyAttributeNone, nullptr);
}

JSContext::~JSContext() {
  ctxInvalid_ = true;
  releaseGlobalString();
  JSGlobalContextRelease(ctx_);
}

void JSContext::evaluateJavaScript(const uint16_t *code, size_t codeLength, const char *sourceURL, int startLine) {
  JSStringRef sourceRef = JSStringCreateWithCharacters(code, codeLength);
  JSStringRef sourceURLRef = nullptr;
  if (sourceURL != nullptr) {
    sourceURLRef = JSStringCreateWithUTF8CString(sourceURL);
  }

  JSValueRef exc = nullptr; // exception
  JSEvaluateScript(ctx_, sourceRef, nullptr /*null means global*/, sourceURLRef, startLine, &exc);

  JSStringRelease(sourceRef);
  if (sourceURLRef) {
    JSStringRelease(sourceURLRef);
  }

  handleException(exc);
}

void JSContext::evaluateJavaScript(const char *code, const char *sourceURL, int startLine) {
  JSStringRef sourceRef = JSStringCreateWithUTF8CString(code);
  JSStringRef sourceURLRef = nullptr;
  if (sourceURL != nullptr) {
    sourceURLRef = JSStringCreateWithUTF8CString(sourceURL);
  }

  JSValueRef exc = nullptr; // exception
  JSEvaluateScript(ctx_, sourceRef, nullptr /*null means global*/, sourceURLRef, startLine, &exc);

  JSStringRelease(sourceRef);
  if (sourceURLRef) {
    JSStringRelease(sourceURLRef);
  }

  handleException(exc);
}

bool JSContext::isValid() {
  return !ctxInvalid_;
}

int32_t JSContext::getContextId() {
  return contextId;
}

void *JSContext::getOwner() {
  return owner;
}

void JSContext::handleException(JSValueRef exc) {
  if (JSC_UNLIKELY(exc)) {
    HANDLE_JSC_EXCEPTION(ctx_, exc, _handler);
    return;
  }
}

JSObjectRef JSContext::global() {
  return JSContextGetGlobalObject(ctx_);
}

JSGlobalContextRef JSContext::context() {
  return ctx_;
}

void JSContext::releaseGlobalString() {
  auto head = std::begin(globalStrings);
  auto tail = std::end(globalStrings);

  while (head != tail) {
    JSStringRef str = *head;
    // Release all global string reference.
    JSStringRelease(str);
    ++head;
  }

  globalStrings.clear();
}

std::unique_ptr<JSContext> createJSContext(int32_t contextId, const JSExceptionHandler &handler, void *owner) {
  return std::make_unique<JSContext>(contextId, handler, owner);
}

std::string JSStringToStdString(JSStringRef jsString) {
  size_t maxBufferSize = JSStringGetMaximumUTF8CStringSize(jsString);
  char *utf8Buffer = new char[maxBufferSize];
  size_t bytesWritten = JSStringGetUTF8CString(jsString, utf8Buffer, maxBufferSize);
  std::string utf_string = std::string(utf8Buffer, bytesWritten - 1);
  delete[] utf8Buffer;
  return utf_string;
}

HostObject::HostObject(std::unique_ptr<JSContext> &context,
                       std::map<std::string, JSObjectCallAsFunctionCallback> &properties)
  : context(context), properties(std::move(properties)) {}

JSValueRef HostObject::getProperty(JSContextRef ctx, JSObjectRef object, JSStringRef propertyName,
                                   JSValueRef *exception) {
  auto hostObject = static_cast<HostObject *>(JSObjectGetPrivate(object));
  auto &context = hostObject->context;
  hostObject->get(context, propertyName, exception);
  context->handleException(*exception);
}

bool HostObject::setProperty(JSContextRef ctx, JSObjectRef object, JSStringRef propertyName, JSValueRef value,
                             JSValueRef *exception) {
  auto hostObject = static_cast<HostObject *>(JSObjectGetPrivate(object));
  auto &context = hostObject->context;
  hostObject->set(context, propertyName, value, exception);
  context->handleException(*exception);
}

bool HostObject::hasProperty(JSContextRef ctx, JSObjectRef object, JSStringRef propertyName) {
  auto hostObject = static_cast<HostObject *>(JSObjectGetPrivate(object));
  std::string name = JSStringToStdString(propertyName);
  return hostObject->properties.contains(name);
}

void HostObject::finalize(JSObjectRef obj) {
  auto hostObject = static_cast<HostObject *>(JSObjectGetPrivate(obj));
  delete hostObject;
}

void HostObject::getPropertyNames(JSContextRef ctx, JSObjectRef object, JSPropertyNameAccumulatorRef accumulator) {
  auto hostObject = static_cast<HostObject *>(JSObjectGetPrivate(object));
  for (auto &properties : hostObject->properties) {
    JSStringRef key = JSStringCreateWithUTF8CString(properties.first.c_str());
    JSPropertyNameAccumulatorAddName(accumulator, key);
    JSStringRelease(key);
  }
}

HostObject::~HostObject() {}

JSValueRef HostObject::get(std::unique_ptr<JSContext> &context, JSStringRef name, JSValueRef *exception) {
  return nullptr;
}

void HostObject::set(std::unique_ptr<JSContext> &context, JSStringRef name, JSValueRef value, JSValueRef *exception) {}

} // namespace kraken::binding::jsc
