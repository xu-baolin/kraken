describe('Box padding', () => {
  it('should work with basic samples', async () => {
    const container1 = document.createElement('div');
    setElementStyle(container1, {
      width: '100px',
      height: '100px',
      backgroundColor: '#666',
      padding: 0,
    });

    document.body.appendChild(container1);

    const container2 = document.createElement('div');
    setElementStyle(container2, {
      width: '50px',
      height: '50px',
      backgroundColor: '#f40',
    });

    container1.appendChild(container2);
    container1.style.padding = '20px';

    await matchViewportSnapshot();
  });

  it('should work with background-color', async () => {
    let div = createElementWithStyle('div', {
      width: '200px',
      height: '200px',
      backgroundColor: 'yellow',
      border: '10px solid cyan',
      padding: '15px',
    });
    append(BODY, div);
    let box = createElementWithStyle('div', {
      width: '50px',
      height: '50px',
      backgroundColor: 'red',
    });
    append(div, box);
    await matchViewportSnapshot();
  });


  it('should can be removed', async () => {
    const container1 = document.createElement('div');
    setElementStyle(container1, {
      display: 'inline-block',
      backgroundColor: 'red',
      padding: '50px',
    });

    document.body.appendChild(container1);
    await matchViewportSnapshot();

    container1.style.padding = '';
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
          backgroundColor: 'green',
          position: 'relative',
        },
      },
      [
        createElement('div', {
          style: {
            height: '100%',
            width: '100%',
            padding: '30%',
            backgroundColor: 'yellow',
          }
        }, [
          createElement('div', {
            style: {
              height: '50px',
              width: '50px',
              backgroundColor: 'red',
            }
          })
        ]),
      ]
    );

    BODY.appendChild(div);
    await matchViewportSnapshot();
  });

  it('should work with percentage of parents width and height not equal', async () => {
    let div;
    div = createElement(
      'div',
      {
        style: {
          width: '100px',
          height: '200px',
          padding: '20px',
          backgroundColor: 'green',
        },
      },
      [
          createElement('div', {
            style: {
              width: '100%',
              height: '100%',
              padding: '30%',
              backgroundColor: 'yellow',
            }
          }, [
              createElement('div', {
                  style: {
                      width: '20px',
                      height: '20px',
                      backgroundColor: 'red'
                  }
               })
          ])
      ]
    );

    BODY.appendChild(div);
    await matchViewportSnapshot();
  });

});
