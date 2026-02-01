Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53B82BE03C
	for <tools@linux.kernel.org>; Sun,  1 Feb 2026 05:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769924260; cv=none; b=HleN9fnNT4Jd2HlvfkLloi8inXRZmI7Uyl6qKTSWiijCYFt5emC24rKaDNpvrNHuvu4d+5JGLn8c4kMKzwXtCNMFQPov4aCJDZ4JfpK2Po0J1U9PsnBgIBiwyQFnurLgnpqy/xKaIDYlhBoS/NLUw9LxMy48VooUZaoyLsg8snU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769924260; c=relaxed/simple;
	bh=B1yAx6PlKLv9cGT1MJYrMkNGzObQ8wRE+h9dnpquzcU=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=BbSBTHWds5OdBNunqauux1uwF73Z9Q6tTtNNdcQm/zQjz66e4ywJMlLpmyxJeaX3w9l8cWLmKlNpNy2lWMHpelkn1bScGR8gHt/qPryL6XYGjrdsauDSHLpECi9icClMRYCm75XrGMpd6oQtxJOS7/vUlZ0QkTt7YzpoGO5hWHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wbpszD9W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wbpszD9W"
Received: by smtp.kernel.org (Postfix)
	id D063AC19425; Sun,  1 Feb 2026 05:37:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CF24C4CEF7;
	Sun,  1 Feb 2026 05:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769924259;
	bh=B1yAx6PlKLv9cGT1MJYrMkNGzObQ8wRE+h9dnpquzcU=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=wbpszD9W2Aht+k7Bz/u5xYuatD1kujODputSeVQ54aHjkYiP3j2AWAGGl0X0Acftk
	 N07dQvx+MaxgSTBUMSW/l071MoehmQBxTm02JQU9TFOX7XL67N7YxnxuUkCGEG9Ice
	 +9vh5ZtCftIfCO30R4oEKHOLM7PNbYXJikyR3Dv0=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH b4 1/2] ez: add SMTP authentication method to printed
 information
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tomas Melin <tomas.melin@vaisala.com>
In-Reply-To: <20260129-smtp-oauth2-outlook-v1-1-e8c6d1b00c03@vaisala.com>
References: <20260129-smtp-oauth2-outlook-v1-0-e8c6d1b00c03@vaisala.com>
 <20260129-smtp-oauth2-outlook-v1-1-e8c6d1b00c03@vaisala.com>
Date: Sun, 01 Feb 2026 00:37:34 -0500
Message-Id: <176992425474.611611.3433768227265573567@lemur>
X-Mailer: b4 0.15-dev

On Thu, 29 Jan 2026 11:10:29 +0200, Tomas Melin <tomas.melin@vaisala.com> wrote:
> diff --git a/src/b4/ez.py b/src/b4/ez.py
> index 298e382..581d513 100644
> --- a/src/b4/ez.py
> +++ b/src/b4/ez.py
> @@ -2193,7 +2193,7 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
>                      sys.exit(1)
>  
>              else:
> -                logger.info('  - via SMTP server %s', smtpserver)
> +                logger.info('  - via SMTP server %s using %s auth', smtpserver, sconfig.get('smtpauth', 'basic'))
>  

This is a nit, but the default value 'basic' is displayed when smtpauth is not
configured, but the actual auth mechanism used by get_smtp() is login-based
(smtp.login()), not "basic". Consider 'login' as a more accurate default label,
or only display the auth method when smtpauth is explicitly set.

>          if not (cmdargs.reflect or cmdargs.resend or cmdargs.preview_to):
>              logger.info('  - tag and reroll the series to the next revision')

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
