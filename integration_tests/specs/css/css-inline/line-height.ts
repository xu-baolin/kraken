describe('line-height', () => {
  it('with unit of px', async () => {
    const div = createElement(
      'div',
      {
        style: {
          'line-height': '100px',
          'box-sizing': 'border-box',
          'backgroundColor': 'green',
          fontSize: '16px',
          width: '200px',
          height: '100px',
        },
      },
      [
        createText(`line height 100px`),
      ]
    );
    BODY.appendChild(div);

    await matchViewportSnapshot();
  });

  it('with unit of number', async () => {
    const div = createElement(
      'div',
      {
        style: {
          'line-height': '3',
          'box-sizing': 'border-box',
          'backgroundColor': 'green',
          fontSize: '16px',
          width: '200px',
          height: '100px',
        },
      },
      [
        createText(`line height 3`),
      ]
    );
    BODY.appendChild(div);

    await matchViewportSnapshot();
  });

  it('with block element', async () => {
    const div = createElement(
      'div',
      {
        style: {
          'line-height': '100px',
          'box-sizing': 'border-box',
          'backgroundColor': 'green',
          fontSize: '16px',
          width: '200px',
          height: '100px',
        },
      },
      [
        createElement(
          'div',
          {
            style: {
              lineHeight: '2',
              'box-sizing': 'border-box',
              'backgroundColor': 'blue',
              fontSize: '16px',
              width: '200px',
              height: '50px',
            },
          },[
            createText(`line height 2`),
          ])
      ]
    );
    BODY.appendChild(div);

    await matchViewportSnapshot();
  });

  it('with inline element', async () => {
    const div = createElement(
      'div',
      {
        style: {
          'line-height': '100px',
          'box-sizing': 'border-box',
          'backgroundColor': 'green',
          fontSize: '16px',
          width: '200px',
          height: '100px',
        },
      },
      [
        createElement(
          'span',
          {
            style: {
              lineHeight: '2',
              'box-sizing': 'border-box',
              'backgroundColor': 'blue',
              fontSize: '16px',
              width: '200px',
              height: '50px',
            },
          },[
            createText(`line height 2`),
          ])
      ]
    );
    BODY.appendChild(div);

    await matchViewportSnapshot();
  });

  it('with flex item', async () => {
    const div = createElement(
      'div',
      {
        style: {
          display: 'flex',
          flexDirection: 'column',
          'line-height': '100px',
          'box-sizing': 'border-box',
          'backgroundColor': 'green',
          fontSize: '16px',
          width: '200px',
          height: '100px',
        },
      },
      [
        createElement(
          'div',
          {
            style: {
              lineHeight: '2',
              'box-sizing': 'border-box',
              'backgroundColor': 'blue',
              fontSize: '16px',
              width: '200px',
              height: '50px',
            },
          },[
            createText(`line height 2`),
          ]),
        createElement(
          'div',
          {
            style: {
              lineHeight: '2',
              'box-sizing': 'border-box',
              'backgroundColor': 'red',
              fontSize: '16px',
              width: '200px',
              height: '50px',
            },
          },[
            createText(`line height 2`),
          ])
      ]
    );
    BODY.appendChild(div);

    await matchViewportSnapshot();
  });

  it('with multiple lines', async () => {
    const div = createElement(
      'div',
      {
        style: {
          'line-height': '100px',
          'box-sizing': 'border-box',
          'backgroundColor': 'green',
          fontSize: '16px',
          width: '200px',
          height: '100px',
        },
      },
      [
        createElement(
          'div',
          {
            style: {
              lineHeight: '2',
              'box-sizing': 'border-box',
              'backgroundColor': 'blue',
              fontSize: '16px',
              width: '200px',
              height: '50px',
            },
          },[
            createText(`line height 2`),
          ]),
        createElement(
          'div',
          {
            style: {
              lineHeight: '2',
              'box-sizing': 'border-box',
              'backgroundColor': 'red',
              fontSize: '16px',
              width: '200px',
              height: '50px',
            },
          },[
            createText(`line height 2`),
          ])
      ]
    );
    BODY.appendChild(div);

    await matchViewportSnapshot();
  });

  it('works with text of multiple lines', async () => {
    let div;
    div = createElement(
      'div',
      {
        style: {
          width: '200px',
          fontFamily: 'Songti SC',
          fontSize: '16px',
          backgroundColor: 'green',
          lineHeight: '30px',
        },
      },
      [
        createText('The line-height CSS property sets the height of a line box. Its commonly used to set the distance between lines of text. On block-level elements, it specifies the minimum height of line boxes within the element. On non-replaced inline elements, it specifies the height that is used to calculate line box height.')
      ]
    );
    BODY.appendChild(div);
    await matchViewportSnapshot();
  });

  it('should work with percentage', async () => {
    let div;
    div = createElement(
      'div',
      {
        style: {
          width: '200px',
          height: '200px',
          backgroundColor: 'yellow',
          position: 'relative',
        },
      },
      [
        createElement('div', {
          style: {
            width: '100px',
            height: '100px',
            backgroundColor: 'green',
            fontSize: '20px',
            lineHeight: '500%',
          }
        }, [
          createText('Kraken')
        ])
      ]
    );
    BODY.appendChild(div);
    await matchViewportSnapshot();
  });

});
