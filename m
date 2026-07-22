Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7818E4334DD
	for <tools@linux.kernel.org>; Wed, 22 Jul 2026 23:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784761438; cv=none; b=S9DAfK8QfT7XLi4eda36szixx31VdMMxOnuAEgUOGWHMz5XlXe7JacQN3MH4kTFzLkKl298aqIX5bQ0RoghL6HaOhP6+OQoS0h2hE7Q49225wo/fUqjHERHfRKmdLTqBidK9jsTDJCBA87cpyB/4mzezAUMt2MAnBy0/u7+Nhbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784761438; c=relaxed/simple;
	bh=ajtinq1Uog/5cndEpsSn3vzcIj6rnnxTWDxodTDwDOw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PJTE1kNS2HTWFHDJtFB2lXelL8HGBoal7Lkpah2ERcq4pXqu5nl6oHCPdHEFXvfWGWLj75KiX7n4EMOlwG33FRTRj/rs7Bqpn12oIVWfdquzKiTcHhDgTomn4q3yAkCWEmmK+Nsy1gSghhotHyP0fVlcLEzgjMBvfGobhw1RkVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nikableh.moe; spf=pass smtp.mailfrom=nikableh.moe; dkim=pass (2048-bit key) header.d=nikableh.moe header.i=@nikableh.moe header.b=bNfYTrEF; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=fEEFuEuc; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nikableh.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nikableh.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nikableh.moe header.i=@nikableh.moe header.b="bNfYTrEF";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="fEEFuEuc"
DKIM-Signature: a=rsa-sha256; b=bNfYTrEFN7AnDQeTIn8kpovu733hN8Pi/6WJATfSbu6g4ZXj2KpA+knHAHi2/eJ0hO4QRGrNY40C2zz1W1aOVqDp7Jurtk1uwH/TbMl76+xzwly7p5AYE144kv475AQJWeUAyUkbnUcS/1XWLbZQtljGovpKm7NjJnMuRyL4TTRapLUNmDn8vLyBAoYo6JjlP8vO6/a8ZK1DVp26nhmB3uis16MGDgKpjFiCLNdh0qM7Bx38OUGXoKgz5tkQrSeaABDgcC6HfL/eCze+u7qT2WbZE94uTv43jE0iJqb3qtoHhnzbz6KuzNQhNnx7eMn2mpx/szRvmMcU6rEcwB8PUQ==; s=purelymail3; d=nikableh.moe; v=1; bh=ajtinq1Uog/5cndEpsSn3vzcIj6rnnxTWDxodTDwDOw=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=fEEFuEucT7sCu8jwnuQLS1G+u0qH93uTlh5iOhoimYUfGGejGFZEOL1bVMwLYSJN4OCDYMmU0OM0ZS6FR1HjP+9ZBkVYYZ8RthPWhcd0gzPvkIXHDQHJIz4L6RfIlkyXy2gbSmcBs16GMeTSlGIgA0uSsfkHPQvWgvrqygouohj2/rcaL/z9hXhN8Xv9gabTq16oNOVSqPXXfgG7Kd/4lBuu+j8Heq6JsDAF6CAqC2UCdZlSIC84Bg0x0d808PXMjdKRp5Uf6G11u2nMMZVtcJ783aNWQiAg5/oCzfAZuxzOWiNuqpFwoZIwNExW68TMiZPp/iiCyGGM3gREqlhihw==; s=purelymail3; d=purelymail.com; v=1; bh=ajtinq1Uog/5cndEpsSn3vzcIj6rnnxTWDxodTDwDOw=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 209604:18551:null:purelymail
X-Pm-Original-To: tools@linux.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1734799623;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Wed, 22 Jul 2026 23:03:47 +0000 (UTC)
From: Nika Krasnova <nika@nikableh.moe>
To: tools@linux.kernel.org
Cc: workflows@vger.kernel.org
Subject: [ANNOUNCE] koshi: a GTK4 client for reading and replying to lore.kernel.org lists
Date: Thu, 23 Jul 2026 01:03:15 +0200
Message-ID: <20260722230315.57499-1-nika@nikableh.moe>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: koshi/0.3.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8

Hi all,

I'd like to announce koshi, a native GTK4 + libadwaita application for
browsing, searching, and replying to the mailing lists archived on
lore.kernel.org.

  https://github.com/nikableh/koshi

lore has excellent archives and git send-email is great for sending, but
I couldn't find a graphical client built around the lore/public-inbox
model that brings the two together. Koshi reads lore directly and,
instead of fighting your email client over formatting, simply invokes
git send-email.

Features
=3D=3D=3D=3D=3D=3D=3D=3D

- Follow a thread and receive notifications without subscribing to the
  whole list.

- Replying and sending goes through git send-email. Your git config and
  credential helpers work unchanged. Koshi has no SMTP path of its own
  and never rewrites message bodies.

- Composition is plain text only. There is no HTML mode.

- Color highlighting for diffs and quotes.

- Rust, GPL-3.0-only. Distributed as a GPG-signed Flatpak; you can
  verify build provenance with gh attestation. Plain cargo and nix
  builds are also available.

Current status
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

v0.3.0. All of the fundamental features are working, with many quality
of life things already planned:

  https://github.com/users/nikableh/projects/11

Installation
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  flatpak remote-add --if-not-exists koshi https://dl.nikableh.moe/koshi.fl=
atpakrepo
  flatpak install koshi moe.nikableh.Koshi

I'm sending this message from koshi itself. If anything about the
headers or formatting looks off, that's a bug; please tell me.

Feedback and questions are welcome.

--=20
Nika Krasnova
