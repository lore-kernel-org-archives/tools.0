Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8F919306A
	for <tools@linux.kernel.org>; Thu, 27 Jun 2024 14:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719498217; cv=none; b=nQPPisxwxeBNDlMm83QTMo/n6XrqR/ZDhmPJIVCe2XWb7TXbe9SlscyiQQh3gDM0v4QGwlqXX5nHU3UnvJhjKci7gDWAnrVQrfaeNVgAOG0XS8USvUMvjxtgfuy98i8gHMeWe64uP54o7kRK1s5ks9TohD2D6f+3ZskTDTHLyJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719498217; c=relaxed/simple;
	bh=boEedlJrZqamiPCrikDC/2yi2oOtyr/8b26DCK/ZhPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gMcKhyfrwPLxWPvaFVf4zDqZfDvWb19Y1uBIqg+iT53u+8ciuomZNFAyyI0VGve/xQB9xgD4ItnHjIXqErfkm64oC1XcxUMMH6gPAaCKfPtgVyRyQfGCftSVLi9Iv3fKsSLejKLltBwtZRpaY3djn4ic5sHFU4RPOZi/ASeb1e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=s1MpPIC5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="s1MpPIC5"
Received: by smtp.kernel.org (Postfix)
	id 30D50C4AF07; Thu, 27 Jun 2024 14:23:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC118C32786;
	Thu, 27 Jun 2024 14:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1719498217;
	bh=boEedlJrZqamiPCrikDC/2yi2oOtyr/8b26DCK/ZhPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s1MpPIC59czniSgbj3WDWdTX2jnM+RGllA+dLtUNs14Sdq4NLa/KDDoXceJFHShvu
	 nJCs+BrytNtPjBg9HPWsJesTlrKuG1fVdO5q5ZHDu8J2dR+iPogBxRqzygDefGbbwm
	 OaYhdxoPHAkZoCMNyLFSb424l1+cjY8yyAWX8yb4=
Date: Thu, 27 Jun 2024 10:23:33 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: tools@kernel.org
Subject: Re: b4 prep --cleanup failure with cover-strategy: branch-description
Message-ID: <20240627-solid-loyal-crane-fdb4b2@meerkat>
References: <ca8f8cab-e62c-4784-bdf8-9c92b2c0202c@quicinc.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ca8f8cab-e62c-4784-bdf8-9c92b2c0202c@quicinc.com>

On Wed, Jun 26, 2024 at 07:23:01PM GMT, Jeff Johnson wrote:
> % b4 prep --cleanup b4/md-drivers-devfreq
> Traceback (most recent call last):
>   File "/usr2/jjohnson/.local/bin/b4", line 8, in <module>
>     sys.exit(cmd())
>   File "/usr2/jjohnson/.local/lib/python3.8/site-packages/b4/command.py", line
> 417, in cmd
>     cmdargs.func(cmdargs)
>   File "/usr2/jjohnson/.local/lib/python3.8/site-packages/b4/command.py", line
> 83, in cmd_prep
>     b4.ez.cmd_prep(cmdargs)
>   File "/usr2/jjohnson/.local/lib/python3.8/site-packages/b4/ez.py", line
> 2766, in cmd_prep
>     return cleanup(cmdargs.cleanup)
>   File "/usr2/jjohnson/.local/lib/python3.8/site-packages/b4/ez.py", line
> 2332, in cleanup
>     ts = tracking['series']
> KeyError: 'series'
> % b4 --version
> 0.14.0

bugbot assign to me
