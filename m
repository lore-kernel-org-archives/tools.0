Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2302DB64C
	for <tools@linux.kernel.org>; Thu, 23 May 2024 15:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716477443; cv=none; b=I1+J+7IwTShKFEdt9GD54KgDyjN3CRF7dDtfpJWUhlpgtnD/QTzMSp+MvlRCsIx5gtG4O5Bf/YzHFoLqRCQ0UvrGNbTipVhYqGr27d8/9FRrFJEOl6Tc1hxP4WFIjVy3A3YVmv3x3nua/VN8DaB3ryeEL20PCDAorecgJCPpF1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716477443; c=relaxed/simple;
	bh=K5rfAHBzNJTd+GsBYaJGub9egy8QlYaY/TMuT65jQsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=udsUoh371PcwrYcxwzh7D2rb6fUKtvPSZCwqqzFoq1XPUeqjZxgvYjk2RL+cwxD1iD2888Lfw/+QX/zVIwddZHwzD9URTjomX/2i2VwLhE3CZe+to/KATEBJhU4hydj89CBaQmQM41wg10JPRnAqeoCYXfBVmgnQuavBdn/1aBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ghShnp33; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ghShnp33"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7538CC2BD10;
	Thu, 23 May 2024 15:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1716477442;
	bh=K5rfAHBzNJTd+GsBYaJGub9egy8QlYaY/TMuT65jQsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ghShnp33EQ8XiCZe4cWQ0XMSj6/2x7A0HxmzWu3VwAN2iMxvP2qmSF+uQXfGiKQSw
	 W3bE1w/oyssPHX6p4VBIsr1ZbvR4z4gBhAE/ekew84D0uweRUmPLGjbsBAbdY30cSx
	 MPj+4eCRKvW0bdMWUp5Tpcf/R5DOP5VhwZ0NiSCE=
Date: Thu, 23 May 2024 11:17:18 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: Checks for recipients
Message-ID: <20240523-pumpkin-hornet-of-performance-0d7da0@lemur>
References: <ZhQ8DoS1GaT0603l@sirena.org.uk>
 <CAMwyc-Q466R2za0sMTD9Chx77hL7xBBuNROokemLmp7dt=i10w@mail.gmail.com>
 <ZiPBx36go0AYBWO7@finisterre.sirena.org.uk>
 <20240420-arboreal-natural-sambar-ff61bc@lemur>
 <ZiRiK4sB6kKwdH7p@finisterre.sirena.org.uk>
 <20240422-sincere-stallion-from-hyperborea-bffddf@lemur>
 <ZktT-sM1I_QFQ8ZH@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZktT-sM1I_QFQ8ZH@sirena.org.uk>

On Mon, May 20, 2024 at 02:45:30PM GMT, Mark Brown wrote:
> Hi Konstantin,
> 
> With current git b4 (621fa62) I'm getting tracebacks doing
> 
>    b4 update --trailers-from ${MSGID} --since ${COMMIT}
> 
> (I'm using ZktD50C5twF1EuKu@fedora or ZktCpcGZdgHWuN_L@fedora as msgid
> here, ${COMMIT} being what I applied those two to):
> 
> Calculating patch-ids from commits, this may take a moment...
> Traceback (most recent call last):
>   File "/home/broonie/git/b4/src/b4/command.py", line 428, in <module>
>     cmd()
>   File "/home/broonie/git/b4/src/b4/command.py", line 410, in cmd
>     cmdargs.func(cmdargs)
>   File "/home/broonie/git/b4/src/b4/command.py", line 85, in cmd_trailers
>     b4.ez.cmd_trailers(cmdargs)
>   File "/home/broonie/git/b4/src/b4/ez.py", line 2786, in cmd_trailers
>     update_trailers(cmdargs)
>   File "/home/broonie/git/b4/src/b4/ez.py", line 1107, in update_trailers
>     if lmsg.followup_trailers:
>        ^^^^^^^^^^^^^^^^^^^^^^
> AttributeError: 'NoneType' object has no attribute 'followup_trailers'

bugbot assign to me
