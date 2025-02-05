export const scrollToBottom = async (node: Element) => {
	node.scroll({ top: node.scrollHeight, behavior: 'smooth' });
};
