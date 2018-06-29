---
title: Echarts几种常见图标和自适应
date: 2018-06-28 18:58:30
tags: [echarts, 自适应]
categories: 其他
---

#### 按需引入Echarts组件

封装组件

index.vue

```js
<template>
  <div ref="chart" class="echarts-container"></div>
</template>

<script>
const echarts = require('echarts/lib/echarts')
// 引入环形图
require("echarts/lib/chart/pie")
// 引入柱状图
require("echarts/lib/chart/bar")
// 引入提示框和标题组件
require('echarts/lib/component/tooltip')
require('echarts/lib/component/legend')
require('echarts/lib/component/title')
// 极坐标系，用于散点图和折线图，每个极坐标系拥有一个角度轴和一个半径轴
require("echarts/lib/component/polar")
// 直角坐标系内绘图网格
require("echarts/lib/component/grid")

export default {
  props: ['options'],
  name: 'echarts',
  data() {
    return {
      chart: null
    }
  },
  watch: {
    options: {
      handler: function() {
        this.initChart()
      },
      deep: true
    }
  },
  mounted() {
    this.initChart()
  },
  methods: {
    initChart() {
      this.$nextTick(() => {
        setTimeout(() => {
          this.chart = echarts.init(this.$refs.chart)
          this.chart.setOption(this.options)
        }, 66)
      })
    },
    handlerResize() {
      window.addEventListener('resize', () => {
        this.chart.resize()
      }, false);
    }
  }
}
</script>

<style lang="scss">
  .echarts-container {
    width: 100%;
    min-height: 200px;
  }
</style>

```

#### 使用Echarts实现饼状图、环形图、柱形图

chart.vue

```js
<template>
  <main class="status-container">
    <echarts ref="chart1" class="echarts" :options="options1"></echarts>
    <echarts ref="chart2" class="echarts" :options="options2"></echarts>
    <echarts ref="chart3" class="echarts" :options="options3"></echarts>
    <echarts ref="chart4" class="echarts" :options="options4"></echarts>
    <echarts ref="chart5" class="echarts" :options="options5"></echarts>
    <loading ref="loading" />
  </main>
</template>

<script>
import Echarts from "@/components/Echarts"

export default {
  name: 'status',
  computed: {
    options1() {
      return {
          title: {
              text: '饼状图1',
              x: 'center'
          },
          tooltip: {
            trigger: 'item',
            formatter: "{b} : {c}"
          },
          series: [
            {
              type: 'pie',
              radius: '25%',
              center: ['50%', '60%'],
              data: [
                {value: 335, name: 'A'},
                {value: 1548, name: 'B'},
                {value: 135, name: 'C'}
              ],
              itemStyle: {
                emphasis: {
                  shadowBlur: 100,
                  shadowOffsetX: 0,
                  shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
              }
            }
          ]
      };
    },
    options2() {
      return {
          title: {
              text: '饼状图2',
              x: 'center'
          },
          tooltip: {
            trigger: 'item',
            formatter: "{b} : {c}"
          },
          series: [
            {
              type: 'pie',
              radius: '55%',
              center: ['50%', '60%'],
              selectedMode: 'single',
              data: [
                {value: 335, name: 'A'},
                {value: 1548, name: 'B'},
                {value: 135, name: 'C'}
              ],
              itemStyle: {
                emphasis: {
                  shadowBlur: 100,
                  shadowOffsetX: 0,
                  shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
              }
            }
          ]
      };
    },
    options3() {
      return {
          title: {
              text: '环形图',
              x: 'center'
          },
          tooltip: {
            trigger: 'item',
            formatter: "{b} : {c}"
          },
          series: [
            {
              type: 'pie',
              radius: ['20%', '30%'],
              center: ['50%', '60%'],
              label: {
                    normal: {
                        show: false,
                        position: 'center'
                    },
                    emphasis: {
                        show: true,
                        textStyle: {
                            fontSize: '24',
                            fontWeight: 'bold'
                        }
                    }
                },
              data: [
                {value: 335, name: 'A'},
                {value: 1548, name: 'B'},
                {value: 135, name: 'C'}
              ]
            }
          ]
      };
    },
    options4() {
      return {
        title: {
            text: '堆叠柱状图',
            x: 'center'
        },
        angleAxis: {
          show: false,
        },
        radiusAxis: {
            type: 'category',
            data: ['周一', '周二', '周三', '周四'],
            min: -4
        },
        polar: {

        },
        series: [{
            type: 'bar',
            data: [1, 2, 3],
            coordinateSystem: 'polar',
            name: 'A',
            stack: 'a'
        }, {
            type: 'bar',
            data: [1, 2, 3, 4],
            coordinateSystem: 'polar',
            name: 'B',
            stack: 'a'
        }, {
            type: 'bar',
            data: [1, 2, 3, 4],
            coordinateSystem: 'polar',
            name: 'C',
            stack: 'a'
        }, {
            type: 'bar',
            data: [1, 2, 3, 4],
            coordinateSystem: 'polar',
            name: 'D',
            stack: 'a'
        }]
      };
    },
    options5() {
      return {
          title: {
              text: '柱状图',
              x: 'center'
          },
          tooltip: {
            trigger: 'axis'
          },
          calculable: true, // 是否显示拖拽用的手柄
          xAxis: [
            {
              type: 'category',
              show: false,
              data: ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L']
            }
          ],
          yAxis: [
            {
              type: 'value',
              show: false
            }
          ],
          series: [
            {
              name: 'A',
              type: 'bar',
              data: [10, 76.7, 135.6, 162.2, 32.6, 20.0]
            },
            {
              name: 'B',
              type: 'bar',
              data: [28.7, 70.7, 175.6, 182.2, 48.7, 18.8]
            }
          ]
      };
    },
  },
  mounted() {
    this.$nextTick(() => {
      this.$refs.chart1.handlerResize()
      this.$refs.chart2.handlerResize()
      this.$refs.chart3.handlerResize()
      this.$refs.chart4.handlerResize()
      this.$refs.chart5.handlerResize()
    })
  },
  components: {
    Echarts
  }
}
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
.status-container {
  height: 100%;
  width: 100%;
  overflow-x: hidden;
  overflow-y: scroll;
  .echarts {
    float: left;
    width: 50%;
    height: 50%;
  }
}
</style>
```

