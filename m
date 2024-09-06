Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2CE1D1F70
	for <tools@linux.kernel.org>; Fri,  6 Sep 2024 14:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725634037; cv=none; b=QIbNypd0UZezZxhSqiTkoicmqF2MsFPNa+VJ4N1Ooj3fgznezWmlRts3Jtm6BE0A7Iv0iNvI1x42V+FePWI9ER7UoJ/xYz6neR0/6tiS0dCS7gEa01ErLkwp7rLJzsWGMbTlEzwa/6NdUEhGcQEUYgRkz8obRikQ1BIpX4cqjEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725634037; c=relaxed/simple;
	bh=Np7EBf6TCG4fIlf33DGIBEqkMbSCWTsg0VEU/83AsLs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ETLMZsYuUmmKfOZJLxc81dpFi3DzwRZm1x0tIG6Tlg2ZFvCCVRw1ZROLXUgkva0yZJKRSe2d6Qnsxh4aYjzlu+iJizSGWnvS3pGVMGhWlS0XXbPk8dt1+E1U1+uc3mR+NI3KAaQG2+9NaPP5THtf5Ugi3iFPsAQ4vkdcUwD6hKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=egomzkFT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="egomzkFT"
Received: by smtp.kernel.org (Postfix)
	id 8920FC4CEC9; Fri,  6 Sep 2024 14:47:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25128C4CECC;
	Fri,  6 Sep 2024 14:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725634037;
	bh=Np7EBf6TCG4fIlf33DGIBEqkMbSCWTsg0VEU/83AsLs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=egomzkFTmCUeIuUBjQGqrKXo/WNOjbo4BLCyBfrGpxamMV+twD37Yzq7xKlmcx7yu
	 vd9RvYrkvDjS76770Tp/00/TgtLTH/vUd9Nz2FEKBHAW8UYbKyvLPnYfr1osVo/8Be
	 Tg2Fs61JAKuh//WTz3BHpCvcFbFUubLVF9qWbOSs=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Celeste Liu <coelacanthushex@gmail.com>
Cc: Joel Granados <j.granados@samsung.com>, 
 Celeste Liu <CoelacanthusHex@gmail.com>
In-Reply-To: <20240823-fix-multiple-smtpserveroption-v2-1-e9df83f7b3f1@gmail.com>
References: <20240823-fix-multiple-smtpserveroption-v2-1-e9df83f7b3f1@gmail.com>
Subject: Re: [PATCH b4 v2] sendemail.smtpServerOption can be specified
 multiple times
Message-Id: <172563403704.23316.6560705074227178519.b4-ty@linuxfoundation.org>
Date: Fri, 06 Sep 2024 10:47:17 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-40f6e


On Fri, 23 Aug 2024 02:32:52 +0800, Celeste Liu wrote:
> In git-send-email(1):
> 
>     The --smtp-server-option option must be repeated for each option you
>     want to pass to the server. Likewise, different lines in
>     the configuration files must be used for each option.
> 
> So this config option must be specified in multivars parameter of
> get_config_from_git() and be treated as a list.
> 
> [...]

Applied, thanks!

[1/1] sendemail.smtpServerOption can be specified multiple times
      commit: 40f6efe297f364e3bec073971e2f29318bb15431

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

