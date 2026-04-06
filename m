Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51ED92F3622
	for <tools@linux.kernel.org>; Mon,  6 Apr 2026 18:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775500456; cv=none; b=NjstHI8p5d2H6tmMUSb3yN9XJ66qk/x8T4s4mRbUZWQEv27+T0AVOTyB5fDmnfwf3YWqZr4CCq/Ik4js1bnmBfqK7Ei5pv2zfRdfLrCzg5QgtwcD5nvxROloxL1W3jI/4z0TScxazMadd64vGSqojylvi09C90Uwx8P0TPZFxxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775500456; c=relaxed/simple;
	bh=KCC0bcD/HFVrFCswDhcuKodFLpWwaXUdpgVV5RAEP/Y=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=iAj9uRU+6yZ3KZBg2SCqL+WWq8nl+bRqYv1g7p0feubmGGnhCcBGWOK0wds9pW9ZyfVjUbfLzMFTn0En/Et1WuJFLDo9E6i0JH3ptramuY+0493YrBWEcPUk6ese5wCoQwzIunF0EhUch/NOL34X4h/EEofjH2qDbUql02KEyEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NHS2Ryr/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NHS2Ryr/"
Received: by smtp.kernel.org (Postfix)
	id E2D86C19421; Mon,  6 Apr 2026 18:34:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90D48C4CEF7;
	Mon,  6 Apr 2026 18:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775500455;
	bh=KCC0bcD/HFVrFCswDhcuKodFLpWwaXUdpgVV5RAEP/Y=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=NHS2Ryr/PUj5gY6sy+qJZDLl4EU0XcfMPC0+9IpAYhx2MEm55MkAIPBQnAJOsmaCu
	 jZqqjG3/VPcKzveL8/gOkN9yq7TTDPSAk/lepq45qwtiQYyiQgGamTV3rH4SILF3bb
	 2CSCmVgV4o/psk1az4bDSuhPkhP4CEw8CU1KbGJg=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: b4 review state is broken after series reorders patches?
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Tamir Duberstein <tamird@gmail.com>, 
 "Kernel.org Tools" <tools@kernel.org>
In-Reply-To: <177549837114.3355865.7109422546107942051.b4-reply@b4>
References: <CAJ-ks9=De02zhrrrbqEO3wUCzBazsiDV8vgpKNKD7=mVUBomCQ@mail.gmail.com>
 <177549837114.3355865.7109422546107942051.b4-reply@b4>
Date: Mon, 06 Apr 2026 14:34:10 -0400
Message-Id: <177550045089.3385816.4021244769990222254.b4-reply@b4>
X-Mailer: b4 0.16-dev-d5553
X-Developer-Signature: v=1; a=openpgp-sha256; l=973;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=KCC0bcD/HFVrFCswDhcuKodFLpWwaXUdpgVV5RAEP/Y=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGDIv/1m296J8A7fvwu/q6bxuHNVdMnEZv16ypqU35ag89
 1mrtH55RykLgxgXg6yYIkvZvthNQYUPPeTSe0xh5rAygQxh4OIUgInYyjL8FTwUY1F6W0qXZ7u3
 wFG+RoG6zU95t63y7/iRfHvz/8vJ4gx/eB6+uvjJQ7rr4MaWTcynmaLSK+RSj2hNk+AI2FMjFpv
 MCQA=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

On Mon, 06 Apr 2026 13:59:31 -0400, Konstantin Ryabitsev wrote:
> - Maintainer writes reviews for v1 and sends them
> - Sender provides v2 in response to feedback
> - Maintainer upgrades to v2 and we carry forward all previous reviews 
>   (but they were already sent, so may or may not be relevant for v2)
> 
> Let me see if we can improve what happens in this scenario.

There is an attempted fix in master. We're now marking comments that 
were sent with sent-revision and will do two things on series upgrade:

- not carry them forward to identical patches from vN to vN+1
- will automatically mark identical patches as "skip" on upgrade, so you 
  should only see patches that have changed

This won't work retroactively, but should kick in next time you send a 
reply to a series.

There are probably still lots of buggy corner-cases with reviews and 
upgrades, so please keep sending the reports in as you discover them.

Best wishes,
-- 
KR

