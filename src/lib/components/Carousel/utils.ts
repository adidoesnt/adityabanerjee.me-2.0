export const incrementWithModulus = (index: number, max: number) => {
    return (index + 1) % max;
};

export const decrementWithModulus = (index: number, max: number) => {
    return (index - 1 + max) % max;
};