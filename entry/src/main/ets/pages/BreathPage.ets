@Component
export struct BreathPage {
  breatheText: Array<ResourceStr> = [
    $r('app.string.breath_msg_01'),
    $r('app.string.breath_msg_02'),
    $r('app.string.breath_msg_03'),
    ''
  ];
  @State currentText: ResourceStr = '';
  @Consume('pageStack') pageStack: NavPathStack;
  private timerId: number | undefined;
  private currentIndex: number = 0;

  aboutToAppear(): void {
    this.startCycle();
  }

  aboutToDisappear(): void {
    if (this.timerId !== undefined) {
      clearInterval(this.timerId);
      this.timerId = undefined;
    }
  }

  private startCycle() {
    this.currentText = this.breatheText[0];

    this.timerId = setInterval(() => {
      this.currentIndex = (this.currentIndex + 1) % this.breatheText.length;
      this.currentText = this.breatheText[this.currentIndex];
    }, 5000);
  }

  build() {
    NavDestination() {
      Column() {
        Image($r('app.media.breath'))
          .objectFit(ImageFit.Contain)
          .width('20%')
          .height('20%');

        Text(this.currentText)
          .margin({ top: 16 })
          .fontColor(Color.White)
          .fontSize(12);
      }
      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.Center)
      .width('100%')
      .height('100%')
      .backgroundColor($r('app.color.background_color'));
    }
    .onReady((ctx: NavDestinationContext) => {
      this.pageStack = ctx.pathStack;
    })
    .hideBackButton(true);
  }
}