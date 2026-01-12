import { ButtonIcon } from '../components/ButtonIcon'
import { DataModel } from '../model/DataModel'

interface SleepItem {
  key: string
  text: ResourceStr
  image: Resource
}

@Component
export struct SleepPage {
  private sleepList: SleepItem[] = [
    {
      key: 'sleep_1',
      text: $r('app.string.sleep_msg_01'),
      image: $r('app.media.sleepSoundsImage')
    },
    {
      key: 'sleep_2',
      text: $r('app.string.sleep_msg_02'),
      image: $r('app.media.sleepSoundsImage2')
    },
    {
      key: 'sleep_3',
      text: $r('app.string.sleep_msg_03'),
      image: $r('app.media.sleepSoundsImage3')
    }
  ]
  @State parameter: Resource = $r('app.media.sleepSoundsImage')
  @Consume('pageStack') pageStack: NavPathStack

  build() {
    NavDestination() {
      Column() {
        List({ space: 10 }) {
          ForEach(
            this.sleepList,
            (item: SleepItem) => {
              ListItem() {
                Row({ space: 2 }) {
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
                this.parameter = item.image
                const paramObject: DataModel = {
                  id: 0,
                  image: this.parameter
                }
                this.pageStack.pushPathByName('SleepPlayPage', paramObject)
              })
            },
            (item: SleepItem) => item.key
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