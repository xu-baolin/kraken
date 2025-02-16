describe('min-width', () => {
  it("should not work with display inline element", async () => {
    let containingBlock = createElement('div', {
      style: {
        border: '2px solid #000',
        minWidth: '300px',
        display: 'inline',
      }
    }, [
      createText('This text should not be wrapped')
    ]);
    BODY.appendChild(containingBlock);

    await matchViewportSnapshot();
  });

  it("should work with display inline-block when it has no children and width not exist", async () => {
    let containingBlock = createElement('div', {
      style: {
        border: '2px solid #000',
        minWidth: '300px',
        height: '100px',
        display: 'inline-block',
      }
    });
    BODY.appendChild(containingBlock);

    await matchViewportSnapshot();
  });

  it("should work with display block when it has no children and width not exist", async () => {
    let containingBlock = createElement('div', {
      style: {
        border: '2px solid #000',
        minWidth: '300px',
        height: '100px',
        display: 'block',
      }
    });
    BODY.appendChild(containingBlock);

    await matchViewportSnapshot();
  });

  it("should work with display inline-flex when it has no children and width not exist", async () => {
    let containingBlock = createElement('div', {
      style: {
        border: '2px solid #000',
        minWidth: '300px',
        height: '100px',
        display: 'inline-flex',
      }
    });
    BODY.appendChild(containingBlock);

    await matchViewportSnapshot();
  });

  it("should work with display flex when it has no children and width not exist", async () => {
    let containingBlock = createElement('div', {
      style: {
        border: '2px solid #000',
        minWidth: '300px',
        height: '100px',
        display: 'flex',
      }
    });
    BODY.appendChild(containingBlock);

    await matchViewportSnapshot();
  });

  it("should work with display inline-block when child length is larger than min-width", async () => {
    let containingBlock = createElement('div', {
      style: {
        border: '2px solid #000',
        minWidth: '200px',
        display: 'inline-block',
      }
    }, [
      createText('This text should be wrapped')
    ]);
    BODY.appendChild(containingBlock);

    await matchViewportSnapshot();
  });

  it("should work with display inline-block when child length is smaller than min-width", async () => {
    let containingBlock = createElement('div', {
      style: {
        border: '2px solid #000',
        minWidth: '300px',
        display: 'inline-block',
      }
    }, [
      createText('This text should not be wrapped')
    ]);
    BODY.appendChild(containingBlock);

    await matchViewportSnapshot();
  });

  it("should work with display inline-flex when child length is larger than min-width", async () => {
    let containingBlock = createElement('div', {
      style: {
        border: '2px solid #000',
        minWidth: '200px',
        display: 'inline-flex',
      }
    }, [
      createText('This text should be wrapped')
    ]);
    BODY.appendChild(containingBlock);

    await matchViewportSnapshot();
  });

  it("should work with display inline-flex when child length is smaller than min-width", async () => {
    let containingBlock = createElement('div', {
      style: {
        border: '2px solid #000',
        minWidth: '300px',
        display: 'inline-flex',
      }
    }, [
      createText('This text should not be wrapped')
    ]);
    BODY.appendChild(containingBlock);

    await matchViewportSnapshot();
  });

  it("should work with display block when child length is larger than min-width", async () => {
    let containingBlock = createElement('div', {
      style: {
        border: '2px solid #000',
        minWidth: '200px',
        display: 'block',
      }
    }, [
      createText('This text should not be wrapped')
    ]);
    BODY.appendChild(containingBlock);

    await matchViewportSnapshot();
  });

  it("should work with display block when child length is smaller than min-width", async () => {
    let containingBlock = createElement('div', {
      style: {
        border: '2px solid #000',
        minWidth: '300px',
        display: 'block',
      }
    }, [
      createText('This text should not be wrapped')
    ]);
    BODY.appendChild(containingBlock);

    await matchViewportSnapshot();
  });


  it("should work with display flex when child length is larger than min-width", async () => {
    let containingBlock = createElement('div', {
      style: {
        border: '2px solid #000',
        minWidth: '200px',
        display: 'flex',
      }
    }, [
      createText('This text should not be wrapped')
    ]);
    BODY.appendChild(containingBlock);

    await matchViewportSnapshot();
  });

  it("should work with display flex when child length is smaller than min-width", async () => {
    let containingBlock = createElement('div', {
      style: {
        border: '2px solid #000',
        minWidth: '300px',
        display: 'flex',
      }
    }, [
      createText('This text should not be wrapped')
    ]);
    BODY.appendChild(containingBlock);

    await matchViewportSnapshot();
  });

  it('should work with replaced element when element width is smaller than intrinsic width', async () => {
    let flexbox;
    flexbox = createElement(
      'div',
      {
        style: {
          'background-color': '#999',
          height: '200px',
          width: '200px',
          'box-sizing': 'border-box',
        },
      },
      [
        createElement('img', {
          src: 'assets/100x100-green.png',
          style: {
            'background-color': 'green',
            minWidth: '50px',
            'box-sizing': 'border-box',
          },
        },
        )
      ]
    );
    BODY.appendChild(flexbox);

    await matchViewportSnapshot(0.1);
  });

  it('should work with replaced element when element width is larger than intrinsic width', async () => {
    let flexbox;
    flexbox = createElement(
      'div',
      {
        style: {
          'background-color': '#999',
          height: '200px',
          width: '200px',
          'box-sizing': 'border-box',
        },
      },
      [
        createElement('img', {
          src: 'assets/100x100-green.png',
          style: {
            'background-color': 'green',
            minWidth: '200px',
            'box-sizing': 'border-box',
          },
        },
        )
      ]
    );
    BODY.appendChild(flexbox);

    await matchViewportSnapshot(0.1);
  });

  it('should work with percentage in flow layout', async () => {
    let div;
    let foo;
    div = createElement(
      'div',
      {
        style: {
          width: '200px',
          height: '200px',
          backgroundColor: 'green',
          position: 'relative',
        },
      },
      [
        createElement('div', {
          style: {
            display: 'inline-block',
            height: '100px',
            minWidth: '50%',
            backgroundColor: 'yellow',
          }
        }),
        createElement('div', {
          style: {
            display: 'inline-block',
            height: '100px',
            minWidth: '50%',
            backgroundColor: 'blue',
          }
        }
        )
      ]
    );

    BODY.appendChild(div);
    await matchViewportSnapshot();
  });

  it('should work with percentage in flex layout in row direction', async () => {
    let div;
    let foo;
    div = createElement(
      'div',
      {
        style: {
          display: 'flex',
          width: '200px',
          height: '200px',
          backgroundColor: 'green',
          position: 'relative',
        },
      },
      [
        createElement('div', {
          style: {
            display: 'inline-block',
            height: '100px',
            minWidth: '50%',
            backgroundColor: 'yellow',
          }
        }),
        createElement('div', {
          style: {
            display: 'inline-block',
            height: '100px',
            minWidth: '50%',
            backgroundColor: 'blue',
          }
        }
        )
      ]
    );

    BODY.appendChild(div);
    await matchViewportSnapshot();
  });

  it('should work with percentage in flex layout in column direction', async () => {
    let div;
    let foo;
    div = createElement(
      'div',
      {
        style: {
          display: 'flex',
          flexDirection: 'column',
          width: '200px',
          height: '200px',
          backgroundColor: 'green',
          position: 'relative',
        },
      },
      [
        createElement('div', {
          style: {
            display: 'inline-block',
            height: '100px',
            minWidth: '50%',
            backgroundColor: 'yellow',
          }
        }),
        createElement('div', {
          style: {
            display: 'inline-block',
            height: '100px',
            minWidth: '50%',
            backgroundColor: 'blue',
          }
        }
        )
      ]
    );

    BODY.appendChild(div);
    await matchViewportSnapshot();
  });
});
