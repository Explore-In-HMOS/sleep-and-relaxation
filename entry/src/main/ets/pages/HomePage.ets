import { ButtonIcon } from '../components/ButtonIcon'

interface HomeItem {
  key: string
  text: ResourceStr
  image: Resource
  target: string
}

@Component
export struct HomePage {
  private homeList: HomeItem[] = [
    {
      key: 'home_breath',
      text: $r('app.string.type_01'),
      image: $r('app.media.breath'),
      target: 'BreathPage'
    },
    {
      key: 'home_sleep',
      text: $r('app.string.type_02'),
      image: $r('app.media.sleep'),
      target: 'SleepPage'
    },
    {
      key: 'home_meditation',
      text: $r('app.string.type_03'),
      image: $r('app.media.meditation'),
      target: 'MeditationPage'
    }
  ]
  @Consume('pageStack') pageStack: NavPathStack

  build() {
    NavDestination() {
      Column() {
        List({ space: 15 }) {
          ForEach(
            this.homeList,
            (item: HomeItem) => {
              ListItem() {
                Row({ space: 8 }) {
                  ButtonIcon(item.image)
                  Text(item.text)
                    .fontColor(Color.White)
                    .fontSize(12)
                }
                .width('60%')
                .height('25%')
                .alignItems(VerticalAlign.Center)
                .justifyContent(FlexAlign.Start)
                .backgroundColor($r('app.color.background_color'))
                .borderRadius(10)
              }
              .alignSelf(ItemAlign.Center)
              .onClick(() => {
                this.pageStack.pushPathByName(item.target, null)
              })
            },
            (item: HomeItem) => item.key
          )
        }
        .width('100%')
        .height('55%')
        .scrollBar(BarState.Off)
        .alignListItem(ListItemAlign.Center)
        .alignSelf(ItemAlign.Center)
      }
      .width('100%')
      .height('100%')
      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.Center)
      .backgroundColor(Color.White)
    }
    .onReady((ctx: NavDestinationContext) => {
      this.pageStack = ctx.pathStack
    })
    .hideBackButton(true)
  }
}