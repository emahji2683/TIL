
document.addEventListener("DOMContentLoaded", async () => {
  const tabListDiv = document.getElementById("tab-list");
  const copyButton = document.getElementById("copy-button");

  // Fetch all tabs
  const tabs = await chrome.tabs.query({});

  // Populate the tab list
  tabs.forEach((tab) => {
    const div = document.createElement("div");
    div.className = "tab-item";

    const checkbox = document.createElement("input");
    checkbox.type = "checkbox";
    checkbox.value = `- [${tab.title}](${tab.url})`;

    const label = document.createElement("label");
    label.textContent = tab.title || tab.url;

    div.appendChild(checkbox);
    div.appendChild(label);
    tabListDiv.appendChild(div);
  });

  // Copy selected tab details to clipboard
  copyButton.addEventListener("click", () => {
    const selectedTabs = [];
    document.querySelectorAll(".tab-item input:checked").forEach((checkbox) => {
      selectedTabs.push(checkbox.value);
    });

    const clipboardText = selectedTabs.join("\n");
    navigator.clipboard.writeText(clipboardText).then(() => {
      alert("Copied to clipboard!");
    }).catch((err) => {
      console.error("Failed to copy text: ", err);
    });
  });
});
