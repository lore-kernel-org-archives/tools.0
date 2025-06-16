Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E63874420
	for <tools@linux.kernel.org>; Mon, 16 Jun 2025 12:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750077948; cv=none; b=qEPprp95A3VnaqniLeweUda9DP4tMmFQYnZZpOjxB7IEtvq16NdUCGdfi3avDV7N12TJNKQKqSL66ODx03i35adLEeT+EWKi3l2NT92hVFwFjBPAPjPAoj7qUy5GCzDiCXoz/eX3+j6vixI0+jFM1Ppen3otd6fVDCBtY3s932I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750077948; c=relaxed/simple;
	bh=vIaf46IeJfmrfexYI0WihDitIN7jM4KhJs7ZZyc1wFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LscU5zZIJ+Eoem7trvFNAf+AkCQIJACEvJrOiXORrohXbwYEQ7c6mLOW2l2sY2uBnaEU2cjLcxPgvX4NOphblswrs1qf2dmru4dFQCc0radEGdjnBu25VLqK5/9NjaGcWyMQVOLh921GFh/JzWOmze0PzC5zcJ09epTlvDmKnJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=stWZMBg7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="stWZMBg7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FD22C4CEEA;
	Mon, 16 Jun 2025 12:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750077947;
	bh=vIaf46IeJfmrfexYI0WihDitIN7jM4KhJs7ZZyc1wFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=stWZMBg7y0/tL1+gcNDAVRIc4YtM7iDXeuWScAF4M9GktU8hyZlrykhJ91OsyUL10
	 nZt5kwjZaw6WylrKSqBKSBHp8BKy34bzg7eQP0u3ig0xR6jRDXQG90nA1JP80l72Qp
	 /8k8UwEQEVcNv0kc6ib8SspVgC3C88bY5oDcr21Y=
Date: Mon, 16 Jun 2025 08:45:46 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools <tools@linux.kernel.org>
Subject: Re: Python backtrace running current master
Message-ID: <20250616-prompt-bulky-kangaroo-eb07e0@lemur>
References: <78832c81-9b84-491b-bb1e-5f67ecddd34b@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <78832c81-9b84-491b-bb1e-5f67ecddd34b@sirena.org.uk>

On Mon, Jun 16, 2025 at 01:41:24PM +0100, Mark Brown wrote:
> Hi,
> 
> With current master (80e1a7f) on Debian stable I'm getting a backtrace
> trying to run b4 with no arguments:
> 
> Traceback (most recent call last):
>   File "/home/broonie/git/b4/src/b4/command.py", line 10, in <module>
>     import b4
>   File "/home/broonie/git/b4/src/b4/__init__.py", line 41
>     type ConfigDictT = Dict[str, Union[str, List[str]], None]
>          ^^^^^^^^^^^
> SyntaxError: invalid syntax

Argh, I guess Debian Stable has Python 3.7? It's EOL since 2023. I'll see if
there is a workaround...

-K
