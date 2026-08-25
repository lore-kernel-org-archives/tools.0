Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC9B3B42F7
	for <tools@linux.kernel.org>; Tue, 25 Aug 2026 21:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787692200; cv=none; b=dgWnwA6nPgSt+jfm2LOb8I3xUg9a523Z7SHXDPQIhvKBk2615doVWBM4pLVXeCIIuRNHCfCISxeAdif/Hl1kgRh7xNzdXAFyLoVku/DeP01x0Bhkm0amFQiVh6Vw/3vuNPd8I9t951+sgngjGmIqVIQd6Gx7HtvKqaF1HOIBI6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787692200; c=relaxed/simple;
	bh=2V5miFsquJGPAdoCEcAml4TwkOZmpbJdYnI7Qg5tMXk=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LN2ofaPKV4K1KcW+eDSfFNwxerVkxnNup1Zg2mpelmG5O6AK/pbz2ZBml0CdbjT+KY/D6zmdXBI87upAYQzG4zp4h8/5oq5GDrbtA0LvQ6DljXDKQLRpz2bEs2VM8CTTUmHGZGoGomCpaiCVxSZSGxRGnufuiOpqV18RIcOT81E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DvSLqgTG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DvSLqgTG"
Received: by smtp.kernel.org (Postfix)
	id 9C28D1F00A3A; Tue, 25 Aug 2026 21:09:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5656D1F000E9;
	Tue, 25 Aug 2026 21:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787692198;
	bh=dpnCs7VzuqKngtut700sBhKrQgoINoFpBhDcyNumq1w=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=DvSLqgTG9wA1MLgG+rlgkgtO9ShWbrb87+1g+aBOwXQtZGLBfcAU7sx/6IBbdJ3bA
	 m8oP9wBjXaJEPh34qM9WogH7x/OgEx6rdz/B+UXmdb0hsL/pJdpFkpF1PxvnkFZv0G
	 OHSHTd+cIausfEqoAumPPQK3OPndkKGasyVJDG10=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org, Jason Gunthorpe <jgg@nvidia.com>
In-Reply-To: <0-v1-0c2c3c276e04+ce2-note_email_jgg@nvidia.com>
References: <0-v1-0c2c3c276e04+ce2-note_email_jgg@nvidia.com>
Subject: Re: [PATCH b4] review-tui: show no-reply preview for note-only
 reviews
Message-Id: <178769219514.3594992.1213749614580238492.b4-ty@b4>
Date: Tue, 25 Aug 2026 21:09:55 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=337;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=NvYYWYe26ecRslqsgpzCxx327S/raX8VoxI3ZtyFef0=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLL6WJaqKyyWOsnNWjx9++XVW37pH+ZbK15ufSVn44ENz
 rrFa1vTOkpZGMS4GGTFFFnK9sVuCip86CGX3mMKM4eVCWQIAxenAExkYifDP+WPD97+YSg2tdn/
 8usJ5ckvGP08bvxs0NupNOXePMZEk20M/2yvekxumfA51PD05VW/5/VMfJl75g7f9twI+/o/O0W
 q93EBAA==
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Tue, 25 Aug 2026 15:08:38 -0300, Jason Gunthorpe wrote:
> review-tui: show no-reply preview for note-only reviews

Applied, thanks!

[1/1] review-tui: show no-reply preview for note-only reviews
      commit: db0b7456d0cd606f397e18fa0c589fc621fa57b5

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

