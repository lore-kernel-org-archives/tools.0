Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793356937;
	b=Bg491O5oElN0bvSuLraFj1caMJl3Cogo2H2VsJPrl5LJRuzY7HSohlBb8iDPkhJChwE+
	 vfj/PsUYlpjEUmj4rgMNGy/jLeCNDaWRb7gT3Bh/bwMwj1FuwVOBhA03l4IcNp0JrNN+w
	 3jZxYXJLQs9dAgSTHaqvMp38U/7iAzlj7QK/twKUykRXIDv31bzC9CYl2bYQOLwFwhPL6
	 b3BXIJ6Il31znMgYeKRGqyriOJeIHy9P0FMrjFcE9vBrnKoLnFc+2PhOIT6d2ssRdJX80
	 h8TWFS9sIyHdyYc4Ajlf0k+6JqCvrkTAJhWqQjcvnkMtYPJoGVVt7wY6iyLtfv+ZzVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356937;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:Received:
	 Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Last-TLS-Session-Version;
	bh=VPRAP6AStjiZ+oIuMhoIcfdl3DGEjkWvBcSq10MJrfg=;
	b=gB/TO/m56Nap3WI9wmFQTQpsEruyrG51tHIrDAIF2pCz6KydnyN1bXiuP/vsDBFI2o4q
	 3mla13M+CLZGc0EKCu53AaxPzVwfn/T8++MZi7RSSARwaeV6BR7JITihsQuEOlBdLm3JS
	 UG12pdmkGA4GgpMUnpqg5sOXqeWuJZpLF35mKP+xplCIEJjyguQQWN7UUJbNM55dwBZ6+
	 dGjdlSZIh+ioUu/LQx2pRUwmQ29+88qujYhJw927z17FbccBlcPrAySjRG2Y9YoUWo446
	 SR6LQFibJDIRsRH8FJ+PFFEri7l8W786QH0Wgn7hMRonLusew9pollVweq2reYS8JGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=GQUcnKv6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755AA606A31A
	for <tools@linux.kernel.org>; Fri, 30 Oct 2026 10:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=GQUcnKv6
Received: by smtp.kernel.org (Postfix)
	id 229821F0093A; Fri, 30 Oct 2026 10:42:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793356936;
	b=LRfcqe315P2hXN9JnG9e/WWYtSM2PBqC+vwCSbk2fyHTycWUYlfAoyNCD0IV4jWr7fvF
	 lqHm5um/Zz+0uKVmSt9ruqMQaCbEkTUXO0/8yAUKzzLXXuNCmjKpcy70CUcNKQMXpRdoE
	 jFknoXhjNJxQJOh+SfN7GvxjO9qncB4ZxXuolnTVRN6uuyGrg67iy2ExDisVKoBcvckZj
	 kI7rGl58MgFw6iMHmh0dYGAdgZZO0seJiKW3+0vfChLWY7BaGMm4zlvDov6s9yfgFq0ZE
	 5n4MtMAcOATNtUIc98b7fTf+yRMOg2IsSfMHDjLnvV+5EFR6W7qoPNEF87gUK3+7QKg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793356936;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Last-TLS-Session-Version;
	bh=VPRAP6AStjiZ+oIuMhoIcfdl3DGEjkWvBcSq10MJrfg=;
	b=tkf+iJKvgXfAxHtnSdMlN1XWUB4oNImUBp13tS3PZ85ZAymQFj5iK0vfhxBlZ/P8kHlT
	 gCjkL5p6JMF4Bvn0KRmCxPFC6k5Yor9ZjLHQHHeZ/SAbFrM/AnNIgSuYtBvZppSis+S80
	 eon7ct0FjgprjtOI1P76J+EqPaMK/Uxdpg+h2KYVUQFrjL5o2E6JoWhioe8Dixu2fPXg6
	 jCFywe/2ezK8CfBEqxC9Mbt9bM7fNvEZB5WmlTrJKX2ZiyRTRpoZoSrdlZhypM5uS/3yo
	 7e9I/fbot2RbffTJkSvzaVuvOHVHfBHYiZIwlnv8TBsHzktOOJPfIVxDLIRIsRmn3+A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=GQUcnKv6;
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 200D51F000C1
	for <tools@kernel.org>; Fri, 30 Oct 2026 10:42:13 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=GQUcnKv6
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 200D51F000C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 26DE44E4139E
	for <tools@kernel.org>; Fri, 30 Oct 2026 10:42:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E90DB603C2;
	Fri, 30 Oct 2026 10:42:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C317810328EFA;
	Fri, 30 Oct 2026 11:42:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793356931; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=VPRAP6AStjiZ+oIuMhoIcfdl3DGEjkWvBcSq10MJrfg=;
	b=GQUcnKv65zaslGiE7oJtegC2qzYsU+pNxoJoYdM03P2ncKitwjOXFp4xvgVnmlQ+a31UUY
	xXqTrgKn2TMgFXnyzo22GBJNJ38Ir2sQ9D8XtunMCeyoJ8zX0LnRBSaiXvaaGph6T36xLi
	Dfivld0HSNiedEFnadmvQwL6FKpsdLoytv2msF/ifgq2To8JJFPl1yqtaE2nO5FRRXG3dE
	/UZvz2ynic27AQ0LD3f7paaPBTo11bZ8R4PxxESi7+UEsTBsb66+ZQ4Pfmhjfnnu61ZvWu
	FpF6SNPpe3ZJhnYGUotZt1+lJ/TKnTMu0iJBfmpOJNehtDNWl2w3XeFnHn/T5w==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH b4 0/2] shazam: pass series URL in env variable for git
 hooks
Date: Fri, 30 Oct 2026 11:41:57 +0100
Message-Id: <20261030-am-env-vars-v1-0-ddaa12797156@bootlin.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMzQrCMBAGX6V8Zxea0L/4KuIhbTftCkbJ1iCUv
 rtRjzMws0M5CSvO1Y7EWVQesYA5VZhWHxcmmQvD1rYztXXk78QxU/ZJqTNDH1rnm8AOpXgmDvL
 +3S4YG1z/Tl/jjaftu8FxfABqB2HmcwAAAA==
X-Change-ID: 20261029-am-env-vars-6187f59a4fe9
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1511;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=hZ57T8fh2khLNK+c4tXuioH0uPVQOrRW1spCFWZS5lw=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq5HR6x8uoBi/7qFPX9V4jQNEuyubTiC4reXrLm
 WG7PPe/+lSJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCauR0egAKCRDRgEFAKaOo
 Nn8bD/9QVr/59eiqZGmQuzYAbPxnn48OlmxdF3m9w8ecREYawRddNisimczSoweXztw1IvPJ1CA
 IdmXSgaM+ayXYfFyH2Et9bgMr4G9LDU+/FiQt1N59o8jFHopeIMVbAEziJo6cV04xLwqCQYg4Gb
 JHd/ohXjRdsLlnxg3ETPlEzvlhlZ8bjuqDWESftQvwuP8TuGgLUiLGWn9+WClU7WHXZZonturhR
 yN/qxfoIZeHyRD+0i7xVYx6ZiUXFSajMv8EvmKNmfrB/tOx3A0wyVnGUqzwrsZ8LAzuzwybnJGx
 lNGhx1xZq/ubW8+obq3vYHN5NsA+Cf//wgtpv1WMdfdIhNDR3K+naYEqskjzEvy2+M01kt9/sZX
 b9y+ErFO+p9LLnLEGohi3ssP6fmE+WXiTgOWC7Z4qpF/ilJUtwQOS2MGVnPk3xNbK2Ej47xBhDZ
 30n2EhmADqiagobMLLyohgbSznEowRGngCPC7uJWkY1HbGQMZVQbPWB7uP0G0crQSEknHuKobvq
 28AQcQVLR62LLNuOKYTyom2iqLppwzXZ3awbxZULV6ebVvjY+rmvze/+moSnSXbQfUrpQD2YnbP
 FO9t76uW/RvPg191ioWj2llL5vL3t2tnQyDJ/NstM8KAQaVeZYMRVadON3uSJAryv5Kh6PapnAi
 3npIxIl428pKgWA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3

This series adds support for passing extra environment variables to git
commands run with git_run_command(), and uses that to pass the series URL
to 'git am' when using shazam.

The rationale behind this addition is that some project do not condone
the usage of Link: trailers in their commits. Having this kind of
information stored in the environment allows using it in other custom
ways, such as a local git note.

For example, the series URL can be used as follows in a repository:

.git/config:

  [hook "b4-post-applypatch"]
    event = post-applypatch
    command = ~/.local/bin/b4-post-applypatch

~/.local/bin/b4-post-applypatch:

  #!/usr/bin/env sh

  git notes add HEAD -m "Link: $B4_SERIES_URL"

Which will create a note with the series URL for each commit applied
with 'git am'.

For now, only B4_SERIES_URL is passed when using shazam (documentation
added in this series) - other pieces of information could be added as
time goes.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (2):
      b4: support passing extra env variables to git commands
      shazam: pass series URL to git am as env variable

 docs/maintainer/am-shazam.rst | 32 ++++++++++++++++++++++++++++++++
 src/b4/__init__.py            | 13 +++++++++++--
 src/b4/mbox.py                |  9 ++++++---
 3 files changed, 49 insertions(+), 5 deletions(-)
---
base-commit: ce4c1158edb292caca0ce4a6087e5edecc1b0371
change-id: 20261029-am-env-vars-6187f59a4fe9

