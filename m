Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933892;
	b=pl8BAtxCMZlBJaJ8VTElz5WF4bwPkvZCM3+VztlKSzHfnkjatGyhRnS1z1N3JAVvQ+tm
	 /1m3eBdOoU8pfmeVJf++EkvW3O8Sng8QvWLWuU/oYMgpukMsP/8+ch4qme2NIaRcwJ2sd
	 aP00/mb/S7L/uPWaQLNQcLzd7trEtD+Z2smNKoxvwN3CLzQFMNKLXK0/DwH5O6W32/a4U
	 6+hfT4vgPhnqJ0s+3rPFTszRluQml9/r2/UMC2IqVRclHmo6FZAO43OPbGwwNY4BucDER
	 CzJ4gK2hPV8JvR9XRL86SIgZNFbhIUH3JdYm0ra6npwJzDJcEr17mWNz5qazUaP2J+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933892;
	h=Received:Delivered-To:Received:DKIM-Signature:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=Qg5wkbrBf+6C2XiEnD4nIr81KJnRQe61aj0lIZKPfAc=;
	b=iBZRU3gFKJ3mAnaVBWHdFqgBQzFz07ulwXaXjZnKB50jx8UFYkWFjqITnXdWnr04V0km
	 t0sFelF6Qilg6kM+VXr5qGHXOIu/dBeVqMoN/fCrTv6QKk7CF+aXSQZ2Na4tYRpEzgEaZ
	 7g/xZtzWRgB5ecmopm31bhWWjpzscKdilPmWTj23/GRuCB3lZ8/BUlXfpmVT+6Snc/GA4
	 Io0b9aRn3JDFf/wC+Oe+o8oprsNJNrvrgRcuC2XxRd5FCjevSwbbEjTz8S6f8HDd3vdSN
	 9Lid9xx62y4AcwXlnvjFbFDv+YtSuSRYH50eXI7JlIDvFqaM9RpLCFLh9FKNGVs9vCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="S/JZoqLs";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E558C606A31C
	for <tools@linux.kernel.org>; Tue, 17 Nov 2026 16:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S/JZoqLs
Received: by smtp.kernel.org (Postfix)
	id D59E21F000C4; Tue, 17 Nov 2026 16:44:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59F091F000C7;
	Tue, 17 Nov 2026 16:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794933891;
	bh=Qg5wkbrBf+6C2XiEnD4nIr81KJnRQe61aj0lIZKPfAc=;
	h=From:Subject:Date:To:Cc;
	b=S/JZoqLse8Jlzu75UxRkp4qfY3cZ5Wnm+wiT3zLM6oZvgdVtROO6coeCpc5YFwWJg
	 o0i+0J57WNR5hfmBV2n2IS5h3ctE2DxPg0ZAUYl0oqmqL2qeXhaSaHpAn1O0cuFm/8
	 T6k7vWPsrqxWkaEySR1xQGh7i8Zp7cwWRiZcNf2QnGfHJ56rLeI5MWuyTl4A36GH74
	 A6zeb+hFxamcXPrHH6Xod6468/PkkbjB9Jy9rmg4ecbKG4DlQoF8BFld0MClz0VC87
	 tIxvAlrfZgpCG81kuFHWeDVBnA2yAZk6NMNlvMIjtlBluZq9SNnjwn1TZjZvcWyG1z
	 0nuiOwJ/u/ZHQ==
From: Brian Masney <masneyb@kernel.org>
Subject: [PATCH b4 0/2] correctly walk a series when a message is missing
 from the lore archive
Date: Tue, 17 Nov 2026 11:44:39 -0500
Message-Id: <20261117-lore-missing-msg-id-fix-v1-0-a5d13a11eb10@kernel.org>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/yXMQQ6CMBAF0Ks0f80kFkwxvYpxIcNQxkgxHTQkh
 LsbZfsWb4NJUTFEt6HIR03njOh85cDjPSch7REd6lMdvPctPeciNKmZ5kSTJdKeBl2JLw0Hbji
 0HFA5vIoMuv7nK7ozbofZu3sIL78S+/4FeSXaWn8AAAA=
X-Change-ID: 20261117-lore-missing-msg-id-fix-c83c6c3c67c6
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Brian Masney <masneyb@kernel.org>
X-Mailer: b4 0.17-dev-f88af
X-Developer-Signature: v=1; a=openpgp-sha256; l=1522; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=COKUon3e6Z1qNz6UgpU+L+Hu8BXKiin0gu/ePYOMsQ4=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLL+tFQIei6YL+fzsf+F4YZlsbsiThnPfzj3sMwh55tpF
 xd37dk4oaOUhUGMi0FWTJFlSa5RQUTqKtt7dzRZYOawMoEMYeDiFICJzDrD8L/o28XzxysUDsSY
 uR7JMGUpmrGsoXJ69dOfh0W7EzwW5Asz/GZbMtOh3iuo73qgSDJf4x2zwlxbq55Fn5UmtvB68O/
 cxAIA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Here's some fixes for the 'b4 am' and 'b4 review tui' that can cause a
trailer from someone to not show up when there is a message missing in
the lore archive.

I ran into this with the series linked below. The message from Brian
with ID avXhA9mJL0EIcm_0@x1g10 is missing from the lore archive. This
causes the Reviewed-by from Jerome that is in the archive to not be
picked up when 'git am' is used. With this change, the trailer is
picked up as expected, and the messages show up in the review TUI,
along with the trailer.
    

Link: https://lore.kernel.org/linux-clk/20261112-upstream-clk-divider-large-rates-v2-0-18f3bb888b0c@baylibre.com/
Signed-off-by: Brian Masney <masneyb@kernel.org>
---
Brian Masney (2):
      correctly walk a series when a message is missing from the lore archive
      review: tui: correctly walk a series when a message is missing from the lore archive

 src/b4/__init__.py               | 15 +++++++++++
 src/b4/review/tracking.py        | 38 +++++++++++++++++++++++++---
 src/b4/review_tui/_common.py     | 46 +++++++++++++++++++++++++++++++---
 src/b4/review_tui/_review_app.py |  6 ++---
 src/tests/test___init__.py       | 31 +++++++++++++++++++++++
 src/tests/test_tui_review.py     | 54 +++++++++++++++++++++++++++++++++++++++-
 6 files changed, 179 insertions(+), 11 deletions(-)
---
base-commit: cad0be6e2c6eddd41ebe13a729464dd406cc4c53
change-id: 20261117-lore-missing-msg-id-fix-c83c6c3c67c6

Best regards,
--  
Brian Masney <masneyb@kernel.org>

