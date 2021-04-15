Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F26E6D13
	for <tools@linux.kernel.org>; Thu, 15 Apr 2021 15:07:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E551E61166;
	Thu, 15 Apr 2021 15:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1618499223;
	bh=7t9MEQcyidZXPsY5Oy9rkDWS3Ui4Uwo+ysyhe7MXFMM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KM5mes+dCQnp46jqzuqlqUKQt1Mbh4WjGpLmLtqZhkYUR0AF63ejlRTfHJS34+dl4
	 KLtaK0mFESA2tk+UaQQbh4mU7bKEdZpdZRaOapZvQNBw9sJJNPNpdSEnEkBfPlyuZB
	 BGOHYR11R/Fm7OcLydC7iPkHeaHPInJfSHa/Q87A=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	tools@linux.kernel.org
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [PATCH 1/2] list-archive-maker: collect recipents in lists instead of strings
Date: Thu, 15 Apr 2021 11:07:00 -0400
Message-Id: <161849908205.21370.14954768680071301207.b4-ty@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210414141235.26630-1-u.kleine-koenig@pengutronix.de>
References: <20210414141235.26630-1-u.kleine-koenig@pengutronix.de>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 14 Apr 2021 16:12:34 +0200, Uwe Kleine-König wrote:
> This is more pythonic and should also be quicker to execute.
> 
> Note there is an (intended) side effect of this change. If cc already
> contains "twentyone@example.com" and pair[1] is "one@example.com", the
> latter was detected as already contained in cc.

Applied, thanks!

[1/2] list-archive-maker: collect recipents in lists instead of strings
      commit: bade6f603831c88ce54eed656f453d1101402451
[2/2] list-archive-maker: better handle mails with misencoded real names
      commit: 21a3a883974f0bc9569aef0fcc6e14706b810f31

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
