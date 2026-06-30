Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916303921CE
	for <tools@linux.kernel.org>; Tue, 30 Jun 2026 13:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782826897; cv=none; b=PgqQGt12CemeEobsCutW3ZADlAW17/aIMYGzXR6hWPkkZUabbtVSEUbYVqLMW/8bFjme5Xbf+GPN+Mz9AQXJvswo0Oy7IWY6EhBZONyDX5CmL5u5MvadtJyGUP4yayFHGff10zcdUrgUScKAT2kH65oT1KvBXN46yFOqQS+st5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782826897; c=relaxed/simple;
	bh=w86Z8/ct1BOyWwlfwKtuYGFJvau3IxV/bgKnmkgHvdk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DF1jOdN7FKJRHnSgIOZdkXH/tveCCQKI3Hv9eVyIyEXy5N6C/vgHRwRCiqffcuIgihZfQmIgtXF+SXTHht/ucbJxFGGUP0pLJDT2/WIN8uxRWBqQeoV7tWe8cq956pSfOQ3o7QkG9wFg1PZS05/4+9v8R1wDfFl1p3SQL48lPhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oRjzg7ka; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oRjzg7ka"
Received: by smtp.kernel.org (Postfix)
	id 3DD1A1F00A3A; Tue, 30 Jun 2026 13:41:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 675BD1F000E9;
	Tue, 30 Jun 2026 13:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782826896;
	bh=Bpkkt6hZPCPhkCguQ19bUxJjNDio/3TFTxkYO1UA8YQ=;
	h=From:Subject:Date:To:Cc;
	b=oRjzg7kaQQQcOgLR+CYyM9ueXbtRTOzbMqqSH5CnMk5eHojCPUtpnlhRlPbQTdwwn
	 BXPpC8LePFDOvnAFOHR6L8zbEq0j42duRaMwTWb/IDMY8wcANXIxItXiNRJlt/jsUV
	 Z/wvC10xAxsSftcTCM2CvgWTKWRfv1j+wQKPZq/FGc6yew5hOT+eKr+l9PVcdmm5sc
	 VX1E0HsfQJpvoAqm3l19LISKSMYoEX+TspT36BMVEC0x131CdN7/kp8RGC1ChF6dyV
	 BWuEUHLkwp3kfl4nZlz3qakCous9XE8Kly4HzHHA1I8Iou2u/Afgq9+bUbQzmYYnZB
	 SxEnc0cVjQOpA==
From: Christian Brauner <brauner@kernel.org>
Subject: [PATCH b4 0/2] review-tui: handle null Patchwork series names
Date: Tue, 30 Jun 2026 15:41:31 +0200
Message-Id: <20260630-review-tui-null-series-name-v1-0-67d7c9334454@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIvHQ2oC/yWMQQ6CMBBFr0Jm7SSFViRexbhoyyhjoJpOqyaEu
 9vK8r38/1YQikwC52aFSG8WfoYC7aEBP9lwJ+SxMHSq61WvFdYRfTBlxpDnGfc/BrsQtu6kjT4
 O42A0lMIr0o2///oFnIHr7iS7B/lUs3XlrBC6aIOfqlqsJIqwbT+n8mfmnAAAAA==
X-Change-ID: 20260630-review-tui-null-series-name-1b734358d843
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-7d1c2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1547; i=brauner@kernel.org;
 h=from:subject:message-id; bh=w86Z8/ct1BOyWwlfwKtuYGFJvau3IxV/bgKnmkgHvdk=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWQ5H++T75zLVW7lW7OhzfFiyJqTqvc+Gmx76ecqNy/ol
 fWj1Y7JHaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABPJD2NkOL9u6Zo+Q1MDmd+f
 2FYzz9n498GP/w+MBQzf7Zg66fqaDSEM/x2CUpjfCLXF3ngrbl/6Sj5za29/4tGZScwPtq4LTe7
 8zwIA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Patchwork returns "name": null for a series posted without a cover
letter. The review TUI's Patchwork app read that field with
series.get('name', '(no subject)') in several places, but the dict
default only applies when the key is absent. A present-but-None
value passes straight through unchanged.

On the bulk set-state path that None reached a Textual Label, which
cannot render it, so opening the apply-state dialog for such a series
crashed the whole TUI during layout:

    VisualError: unable to display 'NoneType' type; must be a str,
    Rich renderable, or Textual Visual object

The track/hide/unhide notification paths shared the same latent bug,
displaying a literal "None" in place of the placeholder.

Switch these spots to the series.get('name') or '(no subject)' idiom
already used by the list-row renderer, so a null name consistently
becomes the placeholder, and add a regression test that drives
set-state on a null-named series and asserts the modal renders.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
Christian Brauner (2):
      review-tui: fall back to '(no subject)' for null Patchwork series names
      review-tui: test null Patchwork series name in bulk set-state

 src/b4/review_tui/_pw_app.py |  8 ++++----
 src/tests/test_tui_pw.py     | 44 +++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 47 insertions(+), 5 deletions(-)
---
base-commit: 4217c3e5d3e1eb259626142fd71b91ec6d5e3d1e
change-id: 20260630-review-tui-null-series-name-1b734358d843

