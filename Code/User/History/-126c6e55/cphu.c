#define CLAY_IMPLEMENTATION
#include "clay/clay.h"
#include "clay/renderers/raylib/clay_renderer_raylib.c"

void error (Clay_ErrorData errorText) {
    printf("%s", errorText.errorText.chars);        
}

int main(void) {
    Clay_Raylib_Initialize(300, 300, "Clay - Raylib Renderer Example", FLAG_WINDOW_RESIZABLE);
    uint64_t clayRequiredMemory = Clay_MinMemorySize();
    Clay_Arena clayMemory = (Clay_Arena) {
        .memory = malloc(clayRequiredMemory),
        .capacity = clayRequiredMemory
    };

    Clay_Initialize(clayMemory, (Clay_Dimensions) {
        .width = GetScreenWidth(),
        .height = GetScreenHeight()
    }, (Clay_ErrorHandler) {
        .errorHandlerFunction = error,
        .userData = 18
    });

    while (!WindowShouldClose()) {
        Clay_BeginLayout();

        // Build UI Here
        CLAY(
            CLAY_RECTANGLE({ .color = { .255, 0, 0, 255}}),
            CLAY_LAYOUT({
                .sizing = {
                    .width = CLAY_SIZING_GROW(),
                    .height = CLAY_SIZING_GROW()
                }
            })
        ) {}


        Clay_RenderCommandArray renderCommands = Clay_EndLayout();
        
       


        
        BeginDrawing();
        ClearBackground(BLACK);
        Clay_Raylib_Render(renderCommands);
        EndDrawing();
    }
}