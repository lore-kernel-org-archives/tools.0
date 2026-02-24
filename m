Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F25A30EF74
	for <tools@linux.kernel.org>; Tue, 24 Feb 2026 19:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771962114; cv=none; b=hrNBm5PZ6qBhKGH2uQp++4vW3X+JAO8jg47I7JzksgRposCW0biAh6uiVQiD1OtoYtRC4wh4LEPPtAXHcE+UR+Ku0sA0Rvjt0t4fb6Ij5KyESjVMCddSlMuAMvQ5ZACl7pK9jVp5NvhUudx1e0wvhQc7aZzrRRFMcQIQtjHbMwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771962114; c=relaxed/simple;
	bh=qEjzM7gcgXEZohX9t2I4A01fr7OStS4CBhss8VoQMz8=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=hMiAf1Tv65yOEWpy5nP/C7lrxYxmrI6yc2IdCtkCz0m6PAqL01HQ1rJUmM49Lx//ZB1d6MRJifRfk/m3yCeqfLHrCjUFEAzvZqAC6dul2mkjDP3PSVQp+EEYiOsJvTqmhgynfC/iKTPNDHJLYi3QzGmscl89BDGinTEgl5cFHyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QOukMSeE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QOukMSeE"
Received: by smtp.kernel.org (Postfix)
	id 814ECC116D0; Tue, 24 Feb 2026 19:41:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33BC6C4AF0E;
	Tue, 24 Feb 2026 19:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771962114;
	bh=qEjzM7gcgXEZohX9t2I4A01fr7OStS4CBhss8VoQMz8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=QOukMSeEqYvAM+30CGdhjJv+kzGeqvhtxoZJJB/LjeqpM08VOq4MP8Ee46qYgE5ZV
	 7z+meioNZACVmLBImUDPnGHSx0raZexSI0+9jllxFbHOfbBJdbp15pY8rHjPVZlqL4
	 365JkB/mTstJcOMjHw/flGeUPyCIncJC5v84ejLQ=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH b4 v2 2/2] b4: add support for xoauth2 SMTP
 authentication
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Tomas Melin <tomas.melin@vaisala.com>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
In-Reply-To: <20260205-smtp-oauth2-outlook-v2-2-6a5eb233b285@vaisala.com>
References: <20260205-smtp-oauth2-outlook-v2-0-6a5eb233b285@vaisala.com>
 <20260205-smtp-oauth2-outlook-v2-2-6a5eb233b285@vaisala.com>
Date: Tue, 24 Feb 2026 14:41:49 -0500
Message-Id: <177196210936.4027376.5259967458341555197@lemur>
X-Mailer: b4 0.15-dev-2caa3

On Thu, 05 Feb 2026 11:26:02 +0200, Tomas Melin <tomas.melin@vaisala.com> wrote:
> diff --git a/src/b4/__init__.py b/src/b4/__init__.py
> index 3d774f7..645659c 100644
> --- a/src/b4/__init__.py
> +++ b/src/b4/__init__.py
> @@ -2826,7 +2827,7 @@ class LoreAttestorPatatt(LoreAttestor):
>  
>  
>  def _run_command(cmdargs: List[str], stdin: Optional[bytes] = None,
> -                 rundir: Optional[str] = None) -> Tuple[int, bytes, bytes]:
> +                 rundir: Optional[str] = None, shell: Optional[bool] = False) -> Tuple[int, bytes, bytes]:

I'm not really happy with *ever* accepting shell=True for a subprocess, because
this opens too many opportunities for an attack vector to sneak in. I know this
is defaulting to False, but I'm still not really happy with it here.

I'd much rather have an _unsafe_run_command() method that is used by specific
functionality than a generic way to run commands unsafely.

(As a side-note, the type annotation Optional[bool] is slightly misleading: the
parameter is never expected to be None. A plain bool = False would be more
precise, but, like I said, I'd much rather not have it done this way at all.)

> @@ -4118,6 +4154,17 @@ def get_smtp(dryrun: bool = False) -> Tuple[Union[smtplib.SMTP, smtplib.SMTP_SSL
>          if smtpauth.lower() == 'none':
>              return smtp, fromaddr
>  
> +        if smtpauth.lower() == 'xoauth2':
> +            logger.debug('Authenticating to SMTP server using xoauth2')
> +            smtpuser = sconfig.get('smtpuser')
> +            if not smtpuser:
> +                raise smtplib.SMTPException('No \'smtpuser\' specified for xoauth2 authentication')
> +            auth_b64 = get_oauth2_token(server, smtpuser)
> +            (ecode, msg) = smtp.docmd('AUTH', 'XOAUTH2 ' + auth_b64)
> +            if ecode != 235:
> +                raise smtplib.SMTPException(f'Error: {ecode}: {msg}')

I think msg returned by smtp.docmd() is a bytes object. In the f-string it will
render as b'2.7.0 Accepted' rather than a clean string. Use msg.decode() (or
similar) for a readable error message.


-- 
KR

