Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0BA30EF74
	for <tools@linux.kernel.org>; Tue, 24 Feb 2026 19:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771962114; cv=none; b=oyN3Fga3JN6UUuj3vw1E/lAAVxaOmL/S6PahtGSNAhdpHl32AryLnRLVM/Qs17dpGykARDmB9zvAmzNX6XQUyufxhpllKjoDG2814b7gRX8kP9+smHWIQamwomlp8r/oXWA/IaXvc3ybus/PtuXmhWRDUO3DWJBDWExEuIlRYt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771962114; c=relaxed/simple;
	bh=hAHPfihVm/KlHBzmZm76XaAx8v7S4Zf+GfNWfwNkMzU=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=ovrUDVoHj/QV7Dkro+M0Xew/XDe9R8T4a3uWdPYZ6wdUv4Zbn31FGVN84v2zmpZ0QbHrEklGfVWvSRNkz8OEQzWxvP63upm86kwA1ooHV8F2FBkt1JR7tr0IfGAXN7Uv4BL6WmKjmPr//aaW3lWXQ9I+QNnqSU2M+fZzqkDAxKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=P1ROA0Ds; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="P1ROA0Ds"
Received: by smtp.kernel.org (Postfix)
	id 12FE6C2BC86; Tue, 24 Feb 2026 19:41:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B841CC116D0;
	Tue, 24 Feb 2026 19:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771962114;
	bh=hAHPfihVm/KlHBzmZm76XaAx8v7S4Zf+GfNWfwNkMzU=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=P1ROA0DszAeb6SqdFIJP7HyQkaSpcGBIrypoJoQewRRIcABkArIE3idskQ6I8H2u+
	 aa1kPplLPvQLEdDLHhBQEv9rL7NDKGFzr6HotXyfoZfmQcvY91wO+wM/UFvpuz9U9b
	 VNCPv9l/P0B/vMXwhlaXyq3A83tjlhM76Nx04hnc=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH b4 v2 1/2] ez: add SMTP authentication method to
 printed information
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Tomas Melin <tomas.melin@vaisala.com>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
In-Reply-To: <20260205-smtp-oauth2-outlook-v2-1-6a5eb233b285@vaisala.com>
References: <20260205-smtp-oauth2-outlook-v2-0-6a5eb233b285@vaisala.com>
 <20260205-smtp-oauth2-outlook-v2-1-6a5eb233b285@vaisala.com>
Date: Tue, 24 Feb 2026 14:41:49 -0500
Message-Id: <177196210935.4027376.15761451190893835481@lemur>
X-Mailer: b4 0.15-dev-2caa3

On Thu, 05 Feb 2026 11:26:01 +0200, Tomas Melin <tomas.melin@vaisala.com> wrote:
> diff --git a/src/b4/ez.py b/src/b4/ez.py
> index 298e382..758220a 100644
> --- a/src/b4/ez.py
> +++ b/src/b4/ez.py
> @@ -2193,7 +2193,11 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
>                      sys.exit(1)
>  
>              else:
> -                logger.info('  - via SMTP server %s', smtpserver)
> +                smtpauth = str(sconfig.get('smtpauth'))

sconfig.get('smtpauth') returns None when the key is absent, and
str(None) is the string "None", which is truthy. This means the
"using %s auth" branch is always taken, printing "using None auth"
when no authentication method is configured. Use the same pattern as
get_smtp() in __init__.py:

    smtpauth = str(sconfig.get('smtpauth', ''))


-- 
KR

