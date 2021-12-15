Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3275B29CA
	for <tools@linux.kernel.org>; Wed, 15 Dec 2021 05:52:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59C77C34604;
	Wed, 15 Dec 2021 05:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1639547532;
	bh=NC7GCX9+W61AvFGjm+S/m+HUvZrl8hwbo9LDK+0+Ubg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FRZ+vZ5GshxDRoeuwvjLbixCnybPFhbOJYbm0ag0qLowjWowEONmEtdYoOhH+DcT5
	 Qp9xbzZn56McGrINcFCUFJ1aiPcx7akduhjy1Tlho4v9WekeXw3jHSZn3WYZiEf4bT
	 RKr3EsNsTjV3xBPm4KaEM/UIN5eePznTlI7QM9RQ=
Date: Wed, 15 Dec 2021 06:52:03 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	tools@linux.kernel.org
Subject: Re: [PATCH] Allow whitespace before a trailer
Message-ID: <YbmCg9/o+zWVjkPE@kroah.com>
References: <20211214214327.4003631-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211214214327.4003631-1-robh@kernel.org>

On Tue, Dec 14, 2021 at 03:43:27PM -0600, Rob Herring wrote:
> Currently, b4 fails to find and add trailers with leading whitespace. Let's
> be a bit more forgiving and allow for that case.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> This thread exhibits the problem:
> https://lore.kernel.org/r/20211206174113.2295616-1-robh%40kernel.org
> 
> Note that patchwork also fails on this. Between fixing b4 or Greg, I 
> went with b4. :)
> 
> ---
>  b4/__init__.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/b4/__init__.py b/b4/__init__.py
> index 11c287eb3433..a4add56c5f80 100644
> --- a/b4/__init__.py
> +++ b/b4/__init__.py
> @@ -1397,7 +1397,7 @@ class LoreMessage:
>          was_trailer = False
>          for line in body.split('\n'):
>              line = line.strip('\r')
> -            matches = re.search(r'^(\w\S+):\s+(\S.*)', line, flags=re.I)
> +            matches = re.search(r'^\s?(\w\S+):\s+(\S.*)', line, flags=re.I)
>              if matches:
>                  groups = list(matches.groups())
>                  # We only accept headers if we haven't seen any non-trailer lines
> -- 
> 2.32.0

Hah, sorry about that, I assumed that b4 was picking these up properly,
my fault.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
