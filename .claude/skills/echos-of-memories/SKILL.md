```markdown
# echos-of-memories Development Patterns

> Auto-generated skill from repository analysis

## Overview

This skill documents the core development patterns and conventions used in the `echos-of-memories` TypeScript codebase. The repository is organized around feature-driven development, with a strong emphasis on state management (using Cubit and Freezed), modular UI screens, and consistent testing practices. The documented workflows help contributors efficiently add new features, screens, and UI/state extensions using clear, repeatable steps.

---

## Coding Conventions

### File Naming

- **Snake case** is used for all file names.
  - Example: `my_feature_cubit.ts`, `user_profile_screen.ts`

### Import Style

- **Relative imports** are preferred.
  ```typescript
  import { MyWidget } from './widgets/my_widget';
  ```

### Export Style

- **Named exports** are used throughout the codebase.
  ```typescript
  // In user_profile_cubit.ts
  export class UserProfileCubit { ... }
  ```

### Commit Messages

- **Conventional commits** are used, with prefixes such as `feat`, `chore`, and `refactor`.
  - Example: `feat: add user profile cubit and state management`

---

## Workflows

### Add Feature Cubit and State
**Trigger:** When you want to add state management for a new feature or screen.  
**Command:** `/new-cubit`

1. **Create a Cubit class** for the feature in `presentation/cubit/`.
   ```typescript
   // lib/features/my_feature/presentation/cubit/my_feature_cubit.ts
   export class MyFeatureCubit { ... }
   ```
2. **Generate or update Freezed state and Cubit files**.
   - Use Freezed to define immutable state classes.
   ```typescript
   // lib/features/my_feature/presentation/cubit/my_feature_state.ts
   export interface MyFeatureState { ... }
   ```
3. **Write or update unit tests** for the Cubit in `test/features/[feature]/`.
   ```typescript
   // test/features/my_feature/my_feature_cubit_test.ts
   import { MyFeatureCubit } from '../../../lib/features/my_feature/presentation/cubit/my_feature_cubit';
   ```

**Files Involved:**
- `lib/features/*/presentation/cubit/*_cubit.ts`
- `lib/features/*/presentation/cubit/*_cubit.freezed.ts`
- `lib/features/*/presentation/cubit/*_state.ts`
- `test/features/*/*_cubit_test.ts`

---

### Add Feature Screen and Route
**Trigger:** When you want to add a new screen and make it navigable via routing.  
**Command:** `/new-screen-route`

1. **Create a new screen widget** in `presentation/screens/`.
   ```typescript
   // lib/features/my_feature/presentation/screens/my_feature_screen.ts
   export function MyFeatureScreen() { ... }
   ```
2. **Register the new route** in `app_routers.ts` and `app_routers.gr.ts`.
   ```typescript
   // lib/core/router/app_routers.ts
   import { MyFeatureScreen } from '../../features/my_feature/presentation/screens/my_feature_screen';
   // Add route definition
   ```

**Files Involved:**
- `lib/features/*/presentation/screens/*_screen.ts`
- `lib/core/router/app_routers.ts`
- `lib/core/router/app_routers.gr.ts`

---

### Extend Feature with UI and State Updates
**Trigger:** When you want to extend an existing feature with new UI elements and corresponding state logic.  
**Command:** `/extend-feature-ui-state`

1. **Add new widget(s)** to `presentation/screens/widgets/`.
   ```typescript
   // lib/features/my_feature/presentation/screens/widgets/my_widget.ts
   export function MyWidget() { ... }
   ```
2. **Update screen(s)** to include the new widget(s).
   ```typescript
   // lib/features/my_feature/presentation/screens/my_feature_screen.ts
   import { MyWidget } from './widgets/my_widget';
   ```
3. **Update Cubit and state classes** to handle new data.
   ```typescript
   // lib/features/my_feature/presentation/cubit/my_feature_cubit.ts
   // Add new state logic
   ```
4. **Update or add tests** for the new state logic.
   ```typescript
   // test/features/my_feature/my_feature_cubit_test.ts
   // Add tests for new state transitions
   ```

**Files Involved:**
- `lib/features/*/presentation/screens/widgets/*.ts`
- `lib/features/*/presentation/screens/*_screen.ts`
- `lib/features/*/presentation/cubit/*_cubit.ts`
- `lib/features/*/presentation/cubit/*_state.ts`
- `test/features/*/*_cubit_test.ts`

---

## Testing Patterns

- **Test files** follow the pattern `*.test.*`.
- Tests are colocated in `test/features/[feature]/`.
- **Unit tests** focus on Cubit logic and state transitions.
  ```typescript
  // test/features/my_feature/my_feature_cubit_test.ts
  describe('MyFeatureCubit', () => {
    it('should update state on event', () => {
      // test logic
    });
  });
  ```

---

## Commands

| Command              | Purpose                                                        |
|----------------------|----------------------------------------------------------------|
| /new-cubit           | Scaffold Cubit and state management for a new feature/screen   |
| /new-screen-route    | Add a new screen and register its route in the app router      |
| /extend-feature-ui-state | Extend an existing feature with new UI and state logic      |
```
