Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794877899;
	b=d8UTP61MMCixKuOaYITRaEUuoZQY9f8Gfa96/ndIwB1ernpI2GduJG+mjoXXIj4rsaZk
	 asEWmz0I9llF+v/SnI+kv/fuZT40RkieAlhsRF015FMwpzwC6Ru11jpQ93EfZflTPU4TW
	 qknLy8CFZQcdoQnRn01LdR3HcxmTamfghGyZMzhf685kQS50LvxRgfYGrK73Zy7NugAf0
	 uuKguLQJU09/64yobIIV+3WFP5ewsUpJO+UXGlKnyLukjeok5y8kMm8hIg8zRfYKMWkNg
	 qYH1nbVwrnJReVhVu+uIk8n08Lk3FvKqGD0waS6eCXsp0nyQ0hYZpA6axUcSPNr8EJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794877899;
	h=Received:Delivered-To:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=DVZ6dOK0NuBxPmYJKwEHVb4VTw3yvuMid9ZsQA1KXVw=;
	b=v4jvDL3BH0VTimQ2SRmBHoB40n6+ZeN2xUQxZkLz4Nu+Ih65njrmNppRo5wJLp5bEjLI
	 iJGhKIWwEZuQAjFXuYrGOvV/VPUvb2gC2ZHjlUuJbblT2H1DGgznalJhdrGuOUu4fhNyX
	 6mNe6zJPldY1UPrmyDKJu6BKaWqIT80wvFe7y/Pm2eh3n5luOVNiv5rvgtfoch6qT2P7g
	 GCjWS8UTONPECyfittU+hOfVSCpufDUqriJDolxnWBGrOYxameyrngFiTD1Gw+VFLkdM3
	 5FQpE05xuOe6DMt4Y4ar3h1V8jip3SKgOnpB7MTKli/fmF5RqLSv7bR9uslW+R1bvXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O1QvRYb5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF8D606A323
	for <tools@linux.kernel.org>; Tue, 17 Nov 2026 01:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O1QvRYb5
Received: by smtp.kernel.org (Postfix)
	id 5AAFF1F000C5; Tue, 17 Nov 2026 01:11:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ACD41F000C4;
	Tue, 17 Nov 2026 01:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794877899;
	bh=DVZ6dOK0NuBxPmYJKwEHVb4VTw3yvuMid9ZsQA1KXVw=;
	h=From:Date:Subject:To:Cc;
	b=O1QvRYb5Rf1Q5ELN1g5PK04w8rhCpkhrc2iEpKhUfZPPJBgYvBqvJv2DHRxLlzoK5
	 i+MS40PiWQfPv/CWAsMoZUNqK9ovI+34QO1v/aR1Q+XBP8u//gGSHyl+PP5xOhDuU/
	 kUbEO0BPBsvJ84AyaWzr1uRvH+Hkg1NrZcVfzQ2JImY2lRtQrjUgkiXwMlczJNCJfm
	 CxHJDLLL4peYHZIm4USOU4QxPYEJ6ZtQgiKzKCV63NttAfshvpqXEFD8nAALnyhOzp
	 eNr9wa9vnLWXHS23wiSGqaf8zH2wKdOPbcznrOY+FY71i0t/ZnbtiH60eCqDPKdYhm
	 TNWNpZWwB3aIg==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 17 Nov 2026 01:09:21 +0000
Subject: [PATCH b4] review: Say why a series is snoozed in patch listings
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261117-why-snooze-v1-1-5a088b24fc42@kernel.org>
X-B4-Tracking: v=1; b=H4sIAEGp+2oC/yWMQQ6CMBQFr0Le2iZ8NGq8inFB8VU+i9b0C6iEu
 1t1OZPMLDBmpeFULcic1DTFArKp0PVtvNHptTCautmLyMHN/ctZTOlNdwzBC4VBti1KcM8M+vz
 NzvA7XP7ORj+we3wvWNcP2eHeYHIAAAA=
X-Change-ID: 20261117-why-snooze-8ffb1e1ef13a
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1945; i=broonie@kernel.org;
 h=from:subject:message-id; bh=zg73NpCc1dBeNcvtYrWGUItf6/Otq13FoV3otENIxOw=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJ+rzxhznlt9SqZ9wwluj/sLe9YfKruv8u23CZgnW6qd
 y3b1QnNHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZiIsgHDX8GjC+stlZ/dt4+Y
 ccgmcf3qBYdiSzz5vR7Y7msWuMz5y52RYd6GljMrfrcI2XScb15wcMXm9Ses/h7U6w9h+TFFpv+
 5Jg8A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

When a series is snoozed it is listed as such with no further information
on what it is waiting for. This makes it harder than it needs to be to
understand why something is waiting, the information is just not available
via the UI. Add a note to the status saying what the condition that the
series is waiting for is.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 docs/maintainer/review.rst         | 3 ++-
 src/b4/review_tui/_tracking_app.py | 4 ++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/docs/maintainer/review.rst b/docs/maintainer/review.rst
index 5a3e9d9..097fd5a 100644
--- a/docs/maintainer/review.rst
+++ b/docs/maintainer/review.rst
@@ -158,7 +158,8 @@ Each row in the tracking list shows:
   are mutually exclusive — ``↑`` can only appear once revision data
   has been fetched
 * **Subject** — compact ``[subsystem,vN,0/M]`` prefix followed by the
-  series subject
+  series subject. Snoozed series show their wake-up date/time or Git tag
+  before the subject, for example ``(until tag v6.15-rc3)``.
 
 **Status symbols**
 
diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 714f215..714132c 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -1005,6 +1005,10 @@ class TrackedSeriesItem(ListItem):
         label.append(prefix_head)
         label.append(ver_token, style=accent if ver_accent else '')
         label.append(prefix_tail)
+        if status == 'snoozed':
+            snoozed_until = self.series.get('snoozed_until')
+            if snoozed_until:
+                label.append(f'({_format_snooze_until(snoozed_until)}) ', style='dim')
         label.append(ls.subject)
         return label
 

---
base-commit: ce4c1158edb292caca0ce4a6087e5edecc1b0371
change-id: 20261117-why-snooze-8ffb1e1ef13a

Best regards,
--  
Mark Brown <broonie@kernel.org>

