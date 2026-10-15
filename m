Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C1D4FB9B1
	for <tools@linux.kernel.org>; Thu, 15 Oct 2026 14:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792073334; cv=none; b=Z4+oDLV/PYcvcDPmf8o4sAVNWVLmw+EHTEwg8G4y7+1WH3DSbTIcRfU4UgAKSEZW0g6kuiSdlGtxwjDL07kbtVMRsF/O5CFTFSUfq2YBlMJ7+WSJEMo2299YbbaqXqh5R9dZmxaXrcKQ1vNYoQKFdTVwWy/AC6ImTcws4U868P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792073334; c=relaxed/simple;
	bh=gwUrvFYCibTcdKrzzXk1FPeeGyLCA8hfudBawcNAcnw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BdHLqBUeEaLjLOymZoFhqHYw8vIcpwkunVqbPmW+ZZtiFEnuTsr6/It2jY0ps/n1n8FPxEfIpMSjm4yaWsd0RKZd7nRIsLbW32G10YBEyXKCMG9FnkZyNUZseFXZxvWEilzNnOvjl5NuewOFSRQO9Vvx64BTfs9xPZOJHzKfjL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GwL5L/x1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GwL5L/x1"
Received: by smtp.kernel.org (Postfix)
	id D5A051F000CB; Thu, 15 Oct 2026 14:08:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD6021F000C4;
	Thu, 15 Oct 2026 14:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792073332;
	bh=my/MDGYWaaOL3Wy9aHOa1orrucV9XDRSqzYNC+D3aWA=;
	h=From:Subject:Date:To:Cc;
	b=GwL5L/x1XXIN6/HTi1KFNzs/8i9aeztpwvIB9ctJ/rWF4ArWK3vhBdbNmo5AIqE1Q
	 SwSQA52eXf0yluZqxnSIUN90yW6GupvUjAahsBrkz9aGBAjbhN7RCQMtOarxB5+ECO
	 uOFtDhmcLUXz8dD8TgC/tveBwR3GqCDhFAFph+dmVDy4m+1jPijwwfhF5gyP/mpZCX
	 LuQOrU+gnISPSFCt+kUiggfHTd0o5yBMNARFJQQfUf00g2B+6TWckqC+K4TBBRFpVr
	 Oofsj1AjDXgIPFUXSUGLUN0nbfhOsPN5F5tEkgxuzvMM4iOK8trvn99hWTOPobz00G
	 BmNmUJ1zXLlQQ==
From: Brian Masney <masneyb@kernel.org>
Subject: [PATCH b4 0/3] review: add support for b4.pw-key-command
Date: Thu, 15 Oct 2026 10:08:40 -0400
Message-Id: <20261015-pw-key-command-v1-0-6daa9b8cee2a@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMzQqDMBAGX0W+cxdMtCJ9ldKDiavdilESf1rEd
 zfW4wzMbAjshQMeyQbPiwQZXAR1S2DflWuZpI4MnepCpepO40od/8gOfV+5mpS2WZHlRnPZIEa
 j50a+/+ETJsfrcmE2H7bTecK+H0P7g692AAAA
X-Change-ID: 20261015-pw-key-command-12c3634b2e8f
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Brian Masney <masneyb@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1076; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=gwUrvFYCibTcdKrzzXk1FPeeGyLCA8hfudBawcNAcnw=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIu3Ms+wBSmcvl91NQ/U6YJ39AUrT6/9NHk+goGZle1Q
 IXJHIvLO0pZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZjI4zsM/8xzbodMi7Q/++xt
 59uEZzNq270eSCqn5r/a73lNNHW5nDHD/5TmqUzCmv8CH0kE6Dov7VA5XBqd/VjqU3fHHzWdNP0
 p/AA=
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Currently the patchwork token needs to be stored plaintext in your git
configuration. This series adds support for b4.pw-key-command so that
the token can be stored in a password manager.

Signed-off-by: Brian Masney <masneyb@kernel.org>
---
Brian Masney (3):
      review: centralize lookup of patchwork key in one place
      review: introduce support for b4.pw-key-command
      review: tests: add tests for get_pw_key() and b4.pw-key-command

 docs/config.rst                    | 16 ++++++++++++
 src/b4/__init__.py                 | 53 ++++++++++++++++++++++++++++++++++++--
 src/b4/review/_review.py           |  4 +--
 src/b4/review_tui/_common.py       |  2 +-
 src/b4/review_tui/_entry.py        |  2 +-
 src/b4/review_tui/_tracking_app.py |  2 +-
 src/tests/test___init__.py         | 53 ++++++++++++++++++++++++++++++++++++++
 7 files changed, 125 insertions(+), 7 deletions(-)
---
base-commit: 6be7c6139d7734d84afddf989fa2874935b6d85b
change-id: 20261015-pw-key-command-12c3634b2e8f

Best regards,
--  
Brian Masney <masneyb@kernel.org>

