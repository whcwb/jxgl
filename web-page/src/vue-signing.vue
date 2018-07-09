<style lang="scss" scoped>
    .vue-signing {
        display: inline-block;
        border: 1px solid #000;
    }
</style>

<template>
    <section class="vue-signing" ref="canvasParent">
        <canvas class="vue-signing__canvas" ref="canvas" :width="currentWidth" :height="height">Render me</canvas>
    </section>
</template>

<script lang="babel">
    export default {
        data () {
            return {
                currentWidth: 0,
                context: null,
                drawPosition: {
                    x: 0,
                    y: 0,
                },
                lastDrawPosition: {
                    x: 0,
                    y: 0,
                },
                drawing: false,
                drawInterval: null,
            };
        },
        mounted () {
            this.context = this.$refs.canvas.getContext('2d');
            this.context.strokeStyle = "#222222";
            this.context.lineWith = 2;

            this.$refs.canvas.addEventListener("mousedown", (event) => {
                this.drawing = true;
                this.lastDrawPosition = this.getMousePosition(event);
            });

            this.$refs.canvas.addEventListener("mouseup", (event) => {
                this.drawing = false;
                this.dispatchSignatureImage();
            });

            this.$refs.canvas.addEventListener("mouseleave", () => {
                this.drawing = false;
                this.dispatchSignatureImage();
            });

            this.$refs.canvas.addEventListener("mousemove", (event) => {
                this.drawPosition = this.getMousePosition(event);
            });

            this.$refs.canvas.addEventListener("touchstart", (event) => {
                event.preventDefault();
                this.drawing = true;
                this.lastDrawPosition = this.getTouchPosition(event);
                this.drawPosition = this.getTouchPosition(event);
            });

            this.$refs.canvas.addEventListener("touchend", (event) => {
                event.preventDefault();
                this.drawing = false;
                this.dispatchSignatureImage();
            });

            this.$refs.canvas.addEventListener("touchmove", (event) => {
                event.preventDefault();
                this.drawPosition = this.getTouchPosition(event);
            });

            this.currentWidth = this.width === 0 ? this.$refs.canvasParent.parentElement.clientWidth : this.width;

            this.drawInterval = setInterval(this.renderCanvas, 1000/120);
        },
        beforeDestroy () {
            clearInterval(this.drawInterval);
        },
        computed: {
            boundingRect() {
                return this.$refs.canvas ? this.$refs.canvas.getBoundingClientRect() : null;
            }
        },
        methods: {
            getMousePosition (event) {
                return {
                    x: event.clientX - this.boundingRect.left,
                    y: event.clientY - this.boundingRect.top
                };
            },
            getTouchPosition (event) {
                return {
                    x: event.touches[0].clientX - this.boundingRect.left,
                    y: event.touches[0].clientY - this.boundingRect.top
                };
            },
            renderCanvas () {
                if(this.drawing) {
                    this.context.moveTo(this.lastDrawPosition.x, this.lastDrawPosition.y);
                    this.context.lineTo(this.drawPosition.x, this.drawPosition.y);
                    this.context.stroke();
                }
                this.lastDrawPosition = this.drawPosition;
            },
            dispatchSignatureImage () {
                this.$emit('input', this.$refs.canvas.toDataURL());
            }
        },
        props: {
            height: {
                required: false,
                type: Number,
                default: 500,
            },
            width: {
                required: false,
                type: Number,
                default: 0,
            },
            value: {
                required: false,
            }
        }
    };
</script>
