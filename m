Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F13DAA0
	for <tools@linux.kernel.org>; Fri, 10 Mar 2023 19:59:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D47A2C433D2;
	Fri, 10 Mar 2023 19:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678478374;
	bh=jejF8u85Fh8ux57x/JHZR9OLBCXirwbKwyCcRdv7C4c=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=mxcQOrclmyCGPC11XoXSElAQ+co46C5mqSPdTllEcWMT8Rivk6yEU19DPyGxA11Xq
	 c578IETcAJho3m9HXdnIix/mDcqgeNYamy9trOK6miPGtoXSk8tS1gW//pC/Ssa6bA
	 bA5gSZho1ZD4wIOrVx3rXz2L/ojO5c5Aup/NSt8A=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org, 
 =?utf-8?q?H=C3=A9ctor_Or=C3=B3n_Mart=C3=ADnez?= <hector.oron@gmail.com>
In-Reply-To: <CAODfWeFXwz4Ci5A=VaUvmyZL2daYe48+OOrjvq6wC-KTJS4hRA@mail.gmail.com>
References: <CAODfWeFXwz4Ci5A=VaUvmyZL2daYe48+OOrjvq6wC-KTJS4hRA@mail.gmail.com>
Subject: Re: b4: allow test run when source is not in git
Message-Id: <167847837373.175846.10033570768854294770.b4-ty@linuxfoundation.org>
Date: Fri, 10 Mar 2023 14:59:33 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-3f473


On Sun, 12 Feb 2023 13:41:40 +0100, Héctor Orón Martínez wrote:
> From c1f039a75378b804f9b8b14c0af947487b4f954a Mon Sep 17 00:00:00 2001
> From: =?UTF-8?q?H=C3=A9ctor=20Or=C3=B3n=20Mart=C3=ADnez?= <zumbi@debian.org>
> Date: Sun, 12 Feb 2023 13:37:56 +0100
> Subject: [PATCH] allow test run when source is not in git
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
> 
> [...]

Applied, thanks!

[1/1] b4: allow test run when source is not in git
      commit: bd1bf7905f2f9c2340b75b5074285105a6fa35f3

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

