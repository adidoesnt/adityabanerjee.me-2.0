export const getDateWithTime = (d: Date) => {
    const date = new Date(d).toLocaleDateString();
    const time = new Date(d).toLocaleTimeString();

    const timeWithoutSeconds = time.split(':').slice(0, 2).join(':');
    
    return `${date} ${timeWithoutSeconds}`;
}
