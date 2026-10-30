Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793368067;
	b=S6ilNsA2+PHGlTNBzkOXC6JHLegzLsm5T/IFA3jNT1lcfhBruX0Jv0Rf1N763aLlabkK
	 kWqe5nZQ7n9GiZev5mM4mZM6QAMt3D16vAvdFylRfLWqzr3JivPNuQ35Kuze1dL9a17HG
	 pnqX+KWDqLdt7OSpYISxN2bscjzN6lY9WT8Ja4uws7mjUMDqv73NsDpXChpsy06qNnyU0
	 Qk1HkPsMZp8LMQ5ejeajhVX5u6kztZFmgFBqICrpTje4j6cH+4yCR8KPcy+hB5TfBtzyP
	 jgqbvbjBlUU3p3C3lPNNI1APkzYDiiLv4AUKzqMETAprXR1twMW4j/Kw0FHWO0KxyKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368067;
	h=Received:Delivered-To:Received:DKIM-Signature:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=DcCPms1/uAW4HYwNAwjp69Yhfbp9Z4XvQ0fgxse+dhM=;
	b=tWENRz6ie9OnI6m/KZPxeOd52u5uSOamHbHBz8uszDogCKWgAX026g6T9jSXEfA0SP+b
	 DD80G/3H/TZ1U0ZCbruPjAPdL25IxWOUW5xIfPIogj4EAdbcBOFjK46Y+fTfISw1JB7c6
	 lR7KKkeLCydC0238VuGs5OwjSWIZYS2YG5/1woRa0gbtreO+rcbaE1BWlNrxqo9QgafGY
	 yel1MObtmyB0dbLaSBIBXHqxowOYJ2iq96OT50yiISrx9gM2KZkgTSJ8Bo2PhMwzlX2Ko
	 kUz1tze7kehUg3omOT3gsiPUDJNUB6ez3+Kd5zHtbOP0b3TlXboA29F8d52rYsLAkAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bu9MqrZN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5F6606A31C
	for <tools@linux.kernel.org>; Fri, 30 Oct 2026 13:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bu9MqrZN
Received: by smtp.kernel.org (Postfix)
	id AC2431F00A02; Fri, 30 Oct 2026 13:47:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25FFC1F0093A;
	Fri, 30 Oct 2026 13:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793368066;
	bh=DcCPms1/uAW4HYwNAwjp69Yhfbp9Z4XvQ0fgxse+dhM=;
	h=From:Subject:Date:To:Cc;
	b=bu9MqrZNCb0K6eW3QwggtRPBCr5kNphlOR2qZkHv1u1JOREjzPu8MrJ4GIY651Yc5
	 SmLpzv49i/UxwGmlKbT4I3cEdy1793BQ17Qe/cIlSOOtczF5hQGUhUKORRkC3vzi+c
	 Dhnk1xacPhez7d+8P4HHOa1S/7NPT5kVL+DMdCLwBrBXEkPoJn5o2MYRfbMuf5di62
	 Pg5Mo2JoePAWsHFPknvEVGwKeS/NT6aqPGC9lp7epywM4Dz9KBnBdlmseRi0eUnd0Q
	 TZqzVTi8xg37NpM5IqZWcm+CkmhI5eypS3mVGvq4MU4MiEGBhsLnfYOOig9mje2xe9
	 4FeX8yEG127+Q==
From: Brian Masney <masneyb@kernel.org>
Subject: [PATCH b4 v2 0/3] review: add support for fetching patchwork token
 via git credentials
Date: Fri, 30 Oct 2026 09:47:27 -0400
Message-Id: <20261030-pw-key-command-v2-0-95fb0f822834@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNyw6CMBREf4XctdfQggRd8R+GRR8XqEhLWkQJ4
 d8tuHY5kzNnVgjkDQW4JSt4mk0wzsbATwmoTtiW0OiYgae8YCm74PjGnhZUbhiE1ci4yoosl5z
 KBuJo9NSYzyG8g8yh/nXhJR+kpt20U50Jk/PL8Tqzg/13MDNMsdBCXGWpiLioevKWnmfnW6i3b
 fsCFoYJwsMAAAA=
X-Change-ID: 20261015-pw-key-command-12c3634b2e8f
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Brian Masney <masneyb@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1278; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=r1/WQxP7U4I2n8GpSi1GrW+0lh2rxZ0VjnwJCPVF8G8=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLKezP+VXyrZ+HrrybIrcxbcjV53MqGgsz70ptBVi+nfE
 rTKC0StO0pZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZiIqQEjwxlVl33X3qYeDpXr
 1P+WW+Uz8Uuz+n/FrT3ZxpuWPL76egkjQ6d+4P5/lw7nuvsdcT9roO/Ma/k5+8JG1mXxr7SWTev
 NZQIA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Currently the patchwork token needs to be stored plaintext in your git
configuration. This series adds support for fetching the token via git
credentials, which allows storing this externally in a password manager
if desired.

Signed-off-by: Brian Masney <masneyb@kernel.org>
---
Changes in v2:
- Changed to use git credentials to fetch the patchwork key.
- Link to v1: https://patch.msgid.link/20261015-pw-key-command-v1-0-6daa9b8cee2a@kernel.org

---
Brian Masney (3):
      review: centralize lookup of patchwork key in one place
      review: add support for fetching patchwork key via git credentials
      review: tests: add tests for the patchwork key

 docs/config.rst                    |  29 ++++++++++
 src/b4/__init__.py                 |  56 +++++++++++++++++-
 src/b4/review/_review.py           |   4 +-
 src/b4/review_tui/_common.py       |   2 +-
 src/b4/review_tui/_entry.py        |   2 +-
 src/b4/review_tui/_tracking_app.py |   2 +-
 src/tests/test___init__.py         | 114 +++++++++++++++++++++++++++++++++++++
 7 files changed, 202 insertions(+), 7 deletions(-)
---
base-commit: 6be7c6139d7734d84afddf989fa2874935b6d85b
change-id: 20261015-pw-key-command-12c3634b2e8f

Best regards,
--  
Brian Masney <masneyb@kernel.org>

