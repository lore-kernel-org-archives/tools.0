Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF402165EA
	for <tools@linux.kernel.org>; Wed, 10 Jun 2026 02:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781058973; cv=none; b=i8oGiUpnjczII87qdySvkrdL+G5aPctaH1zl6vOduepBtFdANwn1YCenql5E40tFlQGZfr/2KNrZaJt2/otIbFDfBvXKiwJmRFiU1iTPJMXmVwoKvKDPlYkv0N8BHlMaq9Kl82bhabW6s2OpzD7ivfxgE3Z0+cnJ2HUBWjiAPGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781058973; c=relaxed/simple;
	bh=OkWk8GAt8+D1Eov5J5+nRQBM/gdmFfWtVSZ7yH9jOcI=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=P3Im7erQaHRFYrioHuziRrKx+3Pd/CkqOHE8pCdX3/Qkmo/AM0Kw+OJDy+yN9hPvFS0pa+JPSdwYK/2Xk5pGPxI8XdzzrWyQ8Rz318/cxIZpLCzsFNgSk3bKtcKXAiTtUIS3w7tHZkjblj8h1qTYI1PtNrJPzdcELxv6+usFoeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Q3mTd9wu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Q3mTd9wu"
Received: by smtp.kernel.org (Postfix)
	id 0A54B1F00898; Wed, 10 Jun 2026 02:36:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A86C81F00893;
	Wed, 10 Jun 2026 02:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781058971;
	bh=DCkJvGWlEqV6L/7ypwKschTWkj05qFPR1+7k7DO+ERg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Q3mTd9wurhLM3UKCR+LPbn2qwdhnsox2jQr7gVlNSt0mbBqK7hi/7LaAsCZbFC8hm
	 lXSExtqU+EbvcQZtxfCnAGId4AouJ7ccBIpWssk7PitVRThIRrktwDMpBGX7Hw1Tx7
	 fPDbNQWRwiVmZfHsZ6no0E+Am1ROGeupAsZDx6L4=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH b4] config: add send-me-too configuration
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jeremy Kerr <jk@codeconstruct.com.au>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
In-Reply-To: <20260429-master-v1-1-f5052d8b7f9b@codeconstruct.com.au>
References: <20260429-master-v1-1-f5052d8b7f9b@codeconstruct.com.au>
Date: Wed, 10 Jun 2026 02:36:08 +0000
Message-Id: <178105896854.172387.14154860070343570175.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1373;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=OkWk8GAt8+D1Eov5J5+nRQBM/gdmFfWtVSZ7yH9jOcI=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLI0zs668uzvh41u195vcr3BM6VOqXXtraMGdwwr2Mu+s
 YV6Smls7ihlYRDjYpAVU2Qp2xe7KajwoYdceo8pzBxWJpAhDFycAjCRXzMZGY5OOacwu0tYyyrO
 2lpafb7Nx/SE8vpI7hvapzw0zLTO6jH8s7jlr+Iwy+rssy3zDHVXL09deWX9p/qstVWxOzIXPpt
 zgBUA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

On Wed, 29 Apr 2026 14:49:46 +0800, Jeremy Kerr <jk@codeconstruct.com.au> wrote:
> diff --git a/docs/contributor/send.rst b/docs/contributor/send.rst
> index ba18ef5..5769cd7 100644
> --- a/docs/contributor/send.rst
> +++ b/docs/contributor/send.rst
> @@ -321,7 +321,9 @@ Command line flags
>    :ref:`contributor_settings`).
>  
>  ``--not-me-too``
> -  Removes your own email address from the recipients.
> +  Removes your own email address from the recipients. This can be set in the
> +  configuration using the :term:`b4.send-me-too`, setting to `no`. (see
> +  :ref:`contributor_settings`).

Small nit -- you probably wanted to use ``no`` here, not `no` (trips me 
up all the time, too).

>
> diff --git a/src/b4/ez.py b/src/b4/ez.py
> index 3e81138..39168e6 100644
> --- a/src/b4/ez.py
> +++ b/src/b4/ez.py
> @@ -2252,7 +2252,8 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
>                  ccdests.append(btr.addr)
>  
>          excludes = b4.get_excluded_addrs()
> -        if cmdargs.not_me_too:
> +        conf_me_too = config.get('send-me-too').lower()
> +        if cmdargs.not_me_too or conf_me_too in {'no', 'n', 'false'}:

Safer to do:

  conf_me_too = str(config.get('send-me-too', 'yes')).lower()

Also, I believe, mypy won't yell at you then. :)

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
