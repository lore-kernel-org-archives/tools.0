Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE9F432E69
	for <tools@linux.kernel.org>; Mon, 27 Jul 2026 20:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184879; cv=none; b=HBDRp2/AiOiCTZzG+5EFVQU8gbXXMYnqECS10TPnkLYj2csT9/Oxh7yvyOvzoZ+BLhDZ9toY2VQ/F4YS2BQtoZMtKEPlT/LgwO+OUVvvN6wRGLQPP5Qb1EaK7F7jeQ7uoFmIi6hSPXxGT8kjmFvCVnpIAitshSrcu/UiUCyjB4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184879; c=relaxed/simple;
	bh=Tx4pMRoJPL0LfSRQ9fFFaGErJc0LilB8r9vD4r11Sk0=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=RFLA4uISw0iXYFZEIladsyGLf+FUxo2GD8b6cngWvo6jvCf+RBHrCGOBPvrmYpWooEnab5DbWlGe2ZdSATn4oqHuXpKmRZeydabF+eei7ZO4P2bqW3vt4BBxflukQ6pCeu05iskEbowq/ECjjB9p4Bt81ugqh6WgsaF1gbdjqA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MdUG0FMg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MdUG0FMg"
Received: by smtp.kernel.org (Postfix)
	id B0E581F000E9; Mon, 27 Jul 2026 20:41:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57E541F00A3A;
	Mon, 27 Jul 2026 20:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785184875;
	bh=C99S72BJflcCRvPoN6qkYJPtPekpX0WxXOqsVVi/AJ0=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=MdUG0FMgkdq2En2MJAlTTpDDnltDW5oYqsDLFawrBAx44mvlxFFe8ov3NFKy91XXI
	 Eq67TG6ZPAG85m5+hTZmpghZEUQojRNZJbM3H9ampwmHL3GiqD0O8Xju+5YvvnOn/S
	 Rcc6GEsEHFzFfOOfGVWQYdTGwv77PZ2BIXWkmiJU=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: b4 review uses the title of the first patch of the series
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, tools@kernel.org
In-Reply-To: <7b03c035-202e-4eee-8029-a257d7f83705@sirena.org.uk>
References: <7b03c035-202e-4eee-8029-a257d7f83705@sirena.org.uk>
Date: Mon, 27 Jul 2026 20:41:09 +0000
Message-Id: <178518486911.2983466.15066411722643607277.b4-reply@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=602;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=Tx4pMRoJPL0LfSRQ9fFFaGErJc0LilB8r9vD4r11Sk0=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLLSD2WZl4XErow+rfnFV+Rw5+4b721T/ypq28xti92QN
 Ltf2C+go5SFQYyLQVZMkaVsX+ymoMKHHnLpPaYwc1iZQIYwcHEKwERWcTEy/Ml9yRFQdzndpelT
 z+Z2h4UN/ramf/eveHBe7S+HaPGhhQz/3WoCAuZbmVZu4p4z/37ptZLZt3R7Li96xXBb4Iqcnh8
 7JwA=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

On Tue, 21 Jul 2026 15:20:04 +0100, Mark Brown wrote:
> Hi Konstantin,
> 
> Recently it seems that b4 review tui has taken to using the title of the
> first patch of a series in the list UI rather than the title of the
> cover letter, for example this is happening with:
> 
>    https://patch.msgid.link/87pl0hjg4g.wl-kuninori.morimoto.gx@renesas.com
> 
> This is confusing and makes looking up a series harder than it should
> be.

There is an attempted fix for this in the current master.

Thanks for the report!

Regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

