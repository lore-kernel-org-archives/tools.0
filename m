Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794314428;
	b=1Msmgo1oyHjUugCZQB8Jf1lwldV3G/0mnZCOzin/F1R8drhN1QoXeJ9cMHUmKehJQgXt
	 6eik48g9gyhuC5Lno5Gkcp6QN5EvkaGCaQpe2D3YHIE82XjQ9l8qvcRdamHVj1bd0TZNS
	 Kzczrzcv0EmEwv0SYjsI8mfap83cgQWMd7K7n9xS4ZvawsX83iTAYS1w0K05jMgxB8eRU
	 KXP7MfNbIr8ugIVWJuTfnNlhjHrSf7cvZ+BgV9PpDmhiy7x0fqQ14wNsx8h1SBADY98W+
	 1HsNJuGHvIMjBZ+1MM9T3Xf5CV3VZ/a+leUIIP7bS8RXm7rN35cC5D47ub0pAS4ECFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314428;
	h=Received:Delivered-To:Received:DMARC-Filter:DKIM-Signature:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Bl4ryjB71+1WGMYQ4z+5m5IA13Tz9pjR28dDUrpuInU=;
	b=yBMID0Me7Id54TUfzX6jyN74pk7TiJREaFO8qvMWy8TRVXyZqfaRV+SYvgT019AM1kbH
	 8XSk5HXVm16VHlGOGX5HSpmX/0QdtCnyVC+WwWGhBQpGmfojIKrJ4V+Tb1HNBcYmZL4Gb
	 UO/mXvSDnRasLgbLMfrohxFQphTfyY5TvZKEm90RRXKl6v1wcq7fN0EdpaYdCQs4zIi1w
	 TjtVugiZxYT0Bni3lGeDIKfUTqtaFQYjnNJT/NUOmXV4ex/5jwLVeKrt5OuR039/gGtDK
	 eIPV6LlXMjfvJQWQBNtortpm8EN1ThxPe258ETS5iLreFOZXfHyTu/VARv815KJLkJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=virtuozzo.com header.i=@virtuozzo.com header.a=rsa-sha256 header.s=relay header.b=O8pW1pYC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F51C60A2600
	for <tools@linux.kernel.org>; Tue, 10 Nov 2026 12:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=virtuozzo.com header.i=@virtuozzo.com header.a=rsa-sha256 header.s=relay header.b=O8pW1pYC
Received: by smtp.kernel.org (Postfix)
	id 51C9D1F008A7; Tue, 10 Nov 2026 12:40:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=130.117.225.111
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794314427;
	b=nyGQ9t3JV32eQWDatnzeMCBwPGQbHveFWzph/4/y5lgmsk1CQqPSONHrixol0vPjr5+j
	 BGwUianLRts/gByyd2XTRHfWg5Mg/FtUtkPzg6BTcqGV2NziXBeALUEkgOUHZmdo24d8o
	 0QIbPdZn19Hn2Om2x0S8bvm+DW9c7wjSqL6e5zeIz+a0KysHRMw6PlJyuevlkKLmNtt8E
	 M810T5bsENt2zxCUaHPmprV66AgMk7Rv6USle9l/Fjc7AGIJS5m60JmkEEhcKHWq+5jur
	 xM+xJuNSqnP3E0ic0VU1qQ09UYyJrIlxSdhNhWPe1rWSvyHRaBsHHz0SiWvy5zr8BWQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794314427;
	h=DMARC-Filter:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Bl4ryjB71+1WGMYQ4z+5m5IA13Tz9pjR28dDUrpuInU=;
	b=MQYoEg4Yp7XDeBL9ps1ohXCuB4M/YVgsCe4oDZxzPpHlMkT9AjX6Rt+1VAkj+cOc5eUk
	 fTovqUqLNMVuvrfJxTdy+yjacnV8EWsHsN9KJt3hcwuPDzojZs8MeQhLj5JHYyEjN1if6
	 WHORrJDvnxt4sykAHuw2RYunE7T9Hes9mlSb6EabZ6gnkUnWNAUV39kbN0LkRulHoMXYt
	 DLwnS3RTOV64F+chsNFbbGbAF9RdHpOy71vOG3gsaS1gJ6RHNzL2BEnQnBnRow6Dx0DCG
	 op5x4rgoh3rfQKfv5g2n1iFXIg+YOQm3Rjd22rZIGFPA3ESbt8oOyG1dbRz8IxTH9gw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=virtuozzo.com header.i=@virtuozzo.com header.a=rsa-sha256 header.s=relay header.b=O8pW1pYC;
	dmarc=pass header.from=virtuozzo.com;
	spf=pass smtp.mailfrom=virtuozzo.com;
	arc=none smtp.remote-ip=130.117.225.111
Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8EBDE1F0089F
	for <tools@kernel.org>; Tue, 10 Nov 2026 12:40:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=virtuozzo.com header.i=@virtuozzo.com header.a=rsa-sha256 header.s=relay header.b=O8pW1pYC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 8EBDE1F0089F
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=virtuozzo.com; s=relay; h=Content-Type:MIME-Version:Message-Id:Date:Subject
	:From; bh=Bl4ryjB71+1WGMYQ4z+5m5IA13Tz9pjR28dDUrpuInU=; b=O8pW1pYCWPMM7RvOejz
	ZArcZ7V9ws5Ttwn4s+3110QzFp3kc+SKyRiY1k7yMUynxWT1PiEvzpOMvqc5iLkKOKHYz3dGyAxuW
	1J8J7YeBHoObGIpnP7P2hF1URWA857Guxd4J8iyJXDy98zceHpIyfww1q8Wjh9MVSr83EuwAYI9Ze
	QG2gXasF3ILMainm1fqCDx02G2Ow5NNWneF+c4YvRbfkFpm+e97xNnsOf5AHBqbU240u88sFb2Bvb
	ld77MLPJnHoMQazewyvRDu3oj8JJiiAW0zqVAmx/S5pOrusOynW56tV8Lk8bqjYRiYmn0ohRSndyY
	Uy8EzgVF1UUvaOQ==;
Received: from ch-demo-asa.virtuozzo.com ([130.117.225.8] helo=f0.sw.ru)
	by relay.virtuozzo.com with esmtp (Exim 4.96)
	(envelope-from <khorenko@virtuozzo.com>)
	id 1xQl52-00E82C-1U;
	Tue, 10 Nov 2026 13:40:08 +0100
From: Konstantin Khorenko <khorenko@virtuozzo.com>
Subject: [PATCH b4 0/2] review: do not carry sent reviews over a revision
 upgrade
Date: Tue, 10 Nov 2026 13:40:10 +0100
Message-Id: <20261110-b4-prep-khorenko-upgrade-skip-sent-reviews-v1-0-4533266d020f@virtuozzo.com>
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
X-B4-Tracking: v=1; b=H4sIAKoQ82oC/yWNwQ6CMBBEf4Xs2Y0UUYy/Qjy0sMBKbJtdUBPCv
 9vq8U1m3mygJEwKt2IDoRcrB5/AHAroJutHQu4TQ1VWF2NMia7GKBRxnoKQnwOucRTbE+rMEZX
 8gtlDb0Xqic5DY4bTtYEkTLuBP7+zFlwN93+mq3tQt+SX3HJWCZ1Y3005CsIj++PT6kIC+/4Fy
 f6bn7IAAAA=
X-Change-ID: 20261110-b4-prep-khorenko-upgrade-skip-sent-reviews-edee5f71f387
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Konstantin Khorenko <khorenko@virtuozzo.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1502;
 i=khorenko@virtuozzo.com; h=from:subject:message-id;
 bh=VoII/lkaItkWp0/ovNt/SnONelp7bXBVw91+4N+pg1Q=;
 b=owEBbQKS/ZANAwAKAVGWCkf5YVwqAcsmYgBq8xCxLv7BY2c6eVIk0CXsmJLo+pDz2vmKQccih
 nh70sIq7HWJAjMEAAEKAB0WIQRWD23IPcXT0GO9CCxRlgpH+WFcKgUCavMQsQAKCRBRlgpH+WFc
 KioqD/4pIW+EVB5TLlziRFFuy1+6mbfKLlu66TMtNRoTpFIQT8q9cE2fz3JxIDR1qv5cVwdQsnW
 KAox7ubzOEBp2hLXJRKv4KHOGl2/WtWMExWlpKFV+lEOOaYPnkyLzdp8DgT4oRa6MwHE7oV7ur9
 WNaZOYC3kHpxQskSjc7tIOUL3MRklKNgJ8owsE19qeXJM0qRuLZoyOPcYjku7UL3mjndIi3zDtQ
 5kIh5bFhdZdL6jjOvzBSyTrFo1wCWyRNM3oT5piaEm79jmlCrisgNanN3Ki6aBINkbcIlTahCGS
 FU2smuMLX+4aLP55Rt8pji0BZjFAumyJ2U9LO2gCpRXxFexYqi94SjCDQAPcLqoYVKbRVaqjLe+
 d61tEVR/j8gvjWlO+HPSz5YV8Rx61ru5SxqR4jFpt0mZztSNqDN/twwB1lR02fDa8xwNfq7zUIQ
 URH1rKn5gE+vuwGHUGipC5ZZA91dNTWg9q1bjTkGoNlhv1yHjH9kqFkknnXzr+5396BZt10r02Y
 x0pE7wcDSU1whl9itv3iEZsgk9cjffblghCZpNEFpoxoUpBsbgf9B3l8tOZt8lVnsNxLTvtychT
 1YJeyeCn/LLsqV851G54wRPVgZUDGtyCEy4lNoTSonNsCAlDhSk33ieX3BDhWaNo8+ej3EwcUG2
 Ws17ui+Dex3k4OA==
X-Developer-Key: i=khorenko@virtuozzo.com; a=openpgp;
 fpr=560F6DC83DC5D3D063BD082C51960A47F9615C2A

A revision upgrade carries the maintainer's reviews of unchanged
patches over unless the series status is "replied".

After a reply the series is often moved to "waiting", and then reviews
that already went out come back as drafts. The next send refuses to go
out until every such patch is marked done or skipped, and skipping also
leaves the patch out of the take by default.

e4b0805 ("review: don't re-send reviews carried over from prior
revision") marked such reviews skipped on upgrade. eb5a313 ("review: add
visual cue for patches unchanged from prior revision") replaced that
with the "unchanged" marker, and a64487d ("review: fix two bugs in
series upgrade workflow") then stopped the carry-over only for a series
in "replied", which a move to "waiting" gets around.

- Patch 1 drops the maintainer's review when it has sent-revision set.
- Patch 2 tests that, and that a draft that was never sent is still
  carried over.

Assisted-by: LLM
---
Konstantin Khorenko (2):
      review: do not carry sent reviews over a revision upgrade
      tests: cover review carry-over on a revision upgrade

 src/b4/review_tui/_tracking_app.py |  4 +++
 src/tests/test_tui_tracking.py     | 72 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)
---
base-commit: ce4c1158edb292caca0ce4a6087e5edecc1b0371
change-id: 20261110-b4-prep-khorenko-upgrade-skip-sent-reviews-edee5f71f387

Best regards,
--  
Konstantin Khorenko,
Virtuozzo Linux Kernel Team

