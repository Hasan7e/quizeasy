import { test, expect } from "@playwright/test";
test.setTimeout(30000);
test("user can visit the homepage", async ({ page }) => {
  // Visit the app
  await page.goto("http://localhost:3000");

  // Expect the page title or navbar text to appear
  await expect(page.getByRole("link", { name: "QuizEasy" })).toBeVisible();
});

test("user can see the login page", async ({ page }) => {
  await page.goto("http://localhost:3000/users/sign_in");

  // Check if the login form is present
  await expect(page.getByLabel("Email")).toBeVisible();
  await expect(page.getByLabel("Password")).toBeVisible();
});
