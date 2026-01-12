import { BreathPage } from './BreathPage';
import { HomePage } from './HomePage';
import { MeditationPage } from './MeditationPage';
import { MeditationPlayPage } from './MeditationPlayPage';
import { SleepPage } from './SleepPage';
import { SleepPlayPage } from './SleepPlayPage';

@Entry
@Component
struct Index {
  @Provide('pageStack') pageStack: NavPathStack = new NavPathStack();

  @Builder
  Pages(name: string) {
    if (name === 'HomePage') {
      HomePage();
    } else if (name === 'BreathPage') {
      BreathPage()
    } else if (name === 'MeditationPage') {
      MeditationPage()
    } else if (name === 'MeditationPlayPage') {
      MeditationPlayPage()
    } else if (name === 'SleepPage') {
      SleepPage()
    } else if (name === 'SleepPlayPage') {
      SleepPlayPage()
    }
  }

  build() {
    Navigation(this.pageStack)
      .mode(NavigationMode.Stack)
      .navDestination(this.Pages)
      .hideNavBar(true)
      .onAppear(() => {
        if (this.pageStack.getAllPathName().length === 0) {
          this.pageStack.pushPathByName('HomePage', null);
        }
      })
  }
}