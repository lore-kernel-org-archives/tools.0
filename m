Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A4D2BEFEE
	for <tools@linux.kernel.org>; Fri, 13 Feb 2026 22:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771020301; cv=none; b=sc1bSDlt+p7Xr1vfBkY0ZGwnmt2/kc48UuC6Z9r0zmcsqMTOul2AbJ4EODBk+IaMFzJXR3gskdMbhvQKdF69J3SzXpZLONaupsV2ANkr6BpdO2YhwriqOsebRDDvZrb9JpVZSyTNddopDuLqooxBI21u5v7tqyePVGGvqx/Er5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771020301; c=relaxed/simple;
	bh=jPHCd3KTaw4n2bX/hwS7jY7iopEgu75OHxfyFcyh5QQ=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=knHu010opORVpGqPm0TGog8+4DjosGZdTVh2D1ow1j73wCJywGCv6MP0oSJAFIGSSWaR/ttyL+dJN+t311OG5p1CLBmP+b+pK6yuSy06NBN69EttcUSYO1PkXMFkI0Esp1NX2ErjzkMSeMQ4bjKV8pvKjOXYTiBpZhrbNN5WNqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=R74p8aV/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="R74p8aV/"
Received: by smtp.kernel.org (Postfix)
	id 18F54C19424; Fri, 13 Feb 2026 22:05:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7C14C16AAE;
	Fri, 13 Feb 2026 22:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771020301;
	bh=jPHCd3KTaw4n2bX/hwS7jY7iopEgu75OHxfyFcyh5QQ=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=R74p8aV/dXW9kMicNyh/9LtfzljnZZ7Ue1oU/Zlma6T2+oNMqwcs28kThzB9GwfVJ
	 k6B55arv5tCqt6E80teLZLSR9WhRV7Ju2PIqMl8r4gqqRqITR8S5BPQawPV/SOrWuU
	 rZbcJUuOyhPlqSZMZpslVhn9J4X2dwB4987So8Xo=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
In-Reply-To: <20260213170418.4138575-2-u.kleine-koenig@baylibre.com>
References: <20260213170418.4138575-2-u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH patatt] contributor-guide: Be more explicit than "Very
 recent versions of git"
Message-Id: <177102030061.2520541.9222199921584124757.b4-ty@linuxfoundation.org>
Date: Fri, 13 Feb 2026 17:05:00 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-4e7d2


On Fri, 13 Feb 2026 18:04:19 +0100, Uwe Kleine-König wrote:
> It was in 2021 (see commit 90b28bed4caf ("Add support for openssh
> signatures")) when Konstantin claimed that you'd need a very recent
> version of git to do openssh signatures. Now more than four years later
> this isn't shiny new any more. So replace the fuzzy version hint with an
> explicit version number that makes it easier for users to decide if
> their git is capable of ssh signatures.
> 
> [...]

Applied, thanks!

[1/1] contributor-guide: Be more explicit than "Very recent versions of git"
      commit: 6b8d07cda802b79109919312bd55e7a865faca73

Best regards,
-- 
KR


