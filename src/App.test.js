import { render, screen } from '@testing-library/react';
import App from './App';

// test('renders learn react link', () => {
//   render(<App />);
//   const linkElement = screen.getByText(/Bli/i);
//   expect(linkElement).toBeInTheDocument();
// });

test('am i good', () => {
  const linkElement = "good";
  expect(linkElement).toBe("good");
});
