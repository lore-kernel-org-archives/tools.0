Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C52A2248A5
	for <tools@linux.kernel.org>; Fri,  6 Mar 2026 14:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772807809; cv=none; b=nyGzLnMWwrJqtnU1gL8+IYyzWoJ2jxXDXpPAnWSPNMuMpX7g8ZJwo3kDLZCDK3UW1lq7NvrjOjCXqjv/Af+uTP+JW9waI7m5cGaaLjvlJXJaepY8nDtXK6WkyDxcIdfabrMf6LyVcnScgfeueDF77v5qcGR+LQXRBIdo8u9i0Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772807809; c=relaxed/simple;
	bh=Sc8r4YUJA3OQOnRZjiv751Nj5jNLEZy6RDzoVSjz0rY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K/d5lBqgmQ8A+dpiW5WgseIioxHH6VmfFydM9lhLaDD7A/CKwVdMSbEMAo6oj5pjNJTfjjLmAeSVasC0y+54LG4Q6sAxH8BpOvnr/6AEHmMwvmOwxby0KTZHWehi7f8UB0y998hGMtbVH3Yl4+kJRc7y8VVzCu8lR1yHA5CfAwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p4zoMEPR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p4zoMEPR"
Received: by smtp.kernel.org (Postfix)
	id B9AA3C2BD01; Fri,  6 Mar 2026 14:36:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B44D4C2BCB7;
	Fri,  6 Mar 2026 14:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772807808;
	bh=Sc8r4YUJA3OQOnRZjiv751Nj5jNLEZy6RDzoVSjz0rY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=p4zoMEPRhtxgjV+8MTba4iAKlsMlDGxX/tZgfUVLxx0jWIROnqiynjhrKVKEbs/y0
	 Xr/ai99xaoSc76c1rkAnMfLRsGpY0e1+R6WnAdAzmvMMbb6SiWfcYfMfjv7mqaNBf0
	 r0TO9Vdjtzl/DXbVLOTbXGtrxhWwXC2LFX7dCFs1R3K+IVMIjNQcfTLhd0Y5V2oRMH
	 fDhuq6+VaRXcgr+rmOj1QthoZbXfZkBP5GGl/uqiIv0IJodxNwcULa+nkb+JjUwuPR
	 PvxheW5MkCJVJnjEVWZIK+LqfJhYGr1TwZ88w9lavfEqawEfTGSi71PpS1oLi8IfxC
	 pQo5q4tMwD0Jw==
Message-ID: <cfd7d6b4-3d19-4405-98e2-52ab3250eff4@kernel.org>
Date: Fri, 6 Mar 2026 15:36:45 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH b4] send: add --in-reply-to option for threading cover
 letters
Content-Language: en-US
To: Christian Brauner <brauner@kernel.org>,
 "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Christian Brauner <christian@amutable.com>
References: <20260306-b4-send-in-reply-to-v1-1-730b9b47d25f@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <20260306-b4-send-in-reply-to-v1-1-730b9b47d25f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/6/26 15:13, Christian Brauner wrote:
> Add a --in-reply-to flag to b4 send that sets the In-Reply-To and
> References headers on the cover letter (or single patch). This allows
> sending a new series version as a reply to the previous version or to

Ewww, don't give people bad ideas please :) That usecase is a mess.

> an existing discussion thread, which is a common workflow on mailing

This makes sense. And it would be really amazing if the given message id was
also used to grab all people from the thread and add them to cc! I find that
part most tedious in these situations. I'm aware the lore page of the
message gives you a command line, but it strips people's names, leaving only
addresses. And it's still manual work.

Thanks!

> lists that b4 did not directly support until now.
> 
> The message ID is automatically wrapped in angle brackets if not
> already provided with them.
> 
> Co-developed-by: Claude Opus 4.6 <noreply@anthropic.com>
> Signed-off-by: Christian Brauner <brauner@kernel.org>
> ---
>  src/b4/command.py |  2 ++
>  src/b4/ez.py      | 14 ++++++++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/src/b4/command.py b/src/b4/command.py
> index a49a8bc..c246d30 100644
> --- a/src/b4/command.py
> +++ b/src/b4/command.py
> @@ -425,6 +425,8 @@ def setup_parser() -> argparse.ArgumentParser:
>                           help='Do not add any addresses found in the cover or patch trailers to To: or Cc:')
>      sp_send.add_argument('--to', nargs='+', metavar='ADDR', help='Addresses to add to the To: list')
>      sp_send.add_argument('--cc', nargs='+', metavar='ADDR', help='Addresses to add to the Cc: list')
> +    sp_send.add_argument('--in-reply-to', dest='in_reply_to', metavar='MSGID',
> +                         help='Message ID to use as In-Reply-To for the cover letter (or single patch)')
>      sp_send.add_argument('--not-me-too', action='store_true', default=False,
>                           help='Remove yourself from the To: or Cc: list')
>      sp_send.add_argument('--resend', metavar='vN', nargs='?', const='latest',
> diff --git a/src/b4/ez.py b/src/b4/ez.py
> index 52eb239..3e703ed 100644
> --- a/src/b4/ez.py
> +++ b/src/b4/ez.py
> @@ -2203,6 +2203,20 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
>              logger.info('')
>              sys.exit(130)
>  
> +    if cmdargs.in_reply_to:
> +        irt = cmdargs.in_reply_to.strip()
> +        if not irt.startswith('<'):
> +            irt = f'<{irt}>'
> +        cover_msg = patches[0][1]
> +        if cover_msg['In-Reply-To']:
> +            cover_msg.replace_header('In-Reply-To', irt)
> +        else:
> +            cover_msg.add_header('In-Reply-To', irt)
> +        if cover_msg['References']:
> +            cover_msg.replace_header('References', irt)
> +        else:
> +            cover_msg.add_header('References', irt)
> +
>      # And now we go through each message to set addressees and send them off
>      sign = True
>      _csnps = str(config.get('send-no-patatt-sign', ''))
> 
> ---
> base-commit: 5b4eaae60fd938a865dda1916885e9a1c7ddce8a
> change-id: 20260306-b4-send-in-reply-to-907e8e36d7f8
> 
> 

