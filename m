Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795628280;
	b=cBkMbL2ZZ6nF6WpNsXuKbE5VO0XKOAPS3daAzUFFejrsqWLGJ+NzLfKgkg2t5Oxb4+Nj
	 YYyoCjRDI/eKc+XWq97F+CczBRu65F6iRI0vbqhKCyNQdpSShIkIlaQZPrmpL4sSZEl96
	 Ajyc+k04yn+6kH6kTfDHgABZsy8OFBulArckoa9RVe/cSQP1TUbzeUYpe9TIHdHRABnkd
	 J+6GYQ1s21z6kfmsNoJmkrt6chLsC3QzBNdfG627j8+XZ8lMSocEYdmbIW+2oZuB2bveQ
	 CYxGNKv7sN0RWgqrquaQJDgTJKkH1c8Zswc/cnqxnx2gUxAmY+ayU9Pqsvl3EAVLklQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795628280;
	h=Received:Delivered-To:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=y2GfbolJKtEgKcxIw4s/iVdPN78tkuAGxjJCEGPA7aY=;
	b=S6VZbvQyywccvHbMEzh7eCZpnekVQ/lIBsrOzFD9rSkBZsoSjTs4iQglXrVHks2lArO0
	 QcYbw1WnZQG8V9a7BzF77wMf+K10VYPskIYC9IEHX4DSA3ojym+9lrugLecehhOGlYydr
	 Pa09h1dGUzWs3kUYIjeF42CsEL+C1MjN+p8prI2aamStYN5vs1B5L47H4DPiIVqb3li99
	 xbJxTSff6FVfk9ptbZ7drQDVl7FOjMOA4UhVjnh+u1ANTIuVq83BNwPa2Hf/VUOBL7kfQ
	 mraA9Z8FdLF6a+GL1GvzsDs2u2X9gqkcH+tNzXRTR7PYWBJ7HQljcq0MtPmNCQ0XDcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=QvH1GqUa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EC7606A332
	for <tools@linux.kernel.org>; Wed, 25 Nov 2026 17:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=QvH1GqUa
Received: by smtp.kernel.org (Postfix)
	id 12C541F000D2; Wed, 25 Nov 2026 17:38:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A73F1F000C4;
	Wed, 25 Nov 2026 17:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795628279;
	bh=y2GfbolJKtEgKcxIw4s/iVdPN78tkuAGxjJCEGPA7aY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=QvH1GqUaetmaBJKsTMIq2lc6u8NwOXHu7XEOTpUsMV4RWvB5/fYYAXdrn/QqrgdYf
	 HxGzfMTY8CC8edZMc5rG+Y2DE9ETjKh0/PgVwE8LcWJzJ8oWSo3sDpsAyXlJMHSm4f
	 F5nXn+yLleYDpjM5Q+gSicPtTrk2ctczjD8lof7w=
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
Subject: Re: [PATCH b4] review: Send replies for skipped patches
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, tools@kernel.org
In-Reply-To: <20261111-reply-skipped-v1-1-2bdb48ab8e3c@kernel.org>
References: <20261111-reply-skipped-v1-1-2bdb48ab8e3c@kernel.org>
Date: Wed, 25 Nov 2026 17:37:57 +0000
Message-Id: <179562827744.1065904.17612093104580984707.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=639;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=OtIOJFARDM6XLhbaBVi+bjPkooGOewzTi8WC9w/rbsw=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLLZZb7NX2V6LJslS3gH2zsLC+Zu/40ef1gFV13/8uxC0
 JM+idYjHaUsDGJcDLJiiixl+2I3BRU+9JBL7zGFmcPKBDKEgYtTACbi+obhf2lHBef0z6L5r5nf
 r3eNajx1Zqub7KW1lTyMF/sqxTWO1TIyfNnXxxt05Ngr7fkZfx8kT1p9hzPjYECWVNF01wtb/vA
 FsQAA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

> Currently when a patch is skipped this includes for email mode, even if
> a reply has been written.  This seems unhelpful, if the user has written
> something it seems reasonable they would want to send it and if they
> want to not send a reply they can always delete it.  Skipping also
> affects patch application and one reason a user might reply to a patch
> is to explain why they are not taking it.
> 
> Change the behaviour so that replies are also sent for skipped patches.

Applied with a few minor tweaks, plus a fix that I found along the way.

Thanks!

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
