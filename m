Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DC735B62F
	for <tools@linux.kernel.org>; Mon, 13 Apr 2026 21:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776115198; cv=none; b=unMXoo3LwSX0wIL8+885IETyx7qkosOtj3PCSqv4Bp67+azzoE4Ubi3Dx+lUOBb3bty5SRrKuD+tL3z2YmZAEZpyae3NeF5xEh2AI6jnQDqZXVyD9RBk1ms7CjtHoVV/kxK5YY4+FABZj1XyzUYRBeRJBMa+ATJS5X7u5aiMaM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776115198; c=relaxed/simple;
	bh=Nv0Lo2AZgi9nazPzIBumHyPNI+rzbMRBuS55QzRHkRs=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=twmR9ZOPSu7sr5sZLJvS7dlaaBR6B13PHaUAL9jHC5OHFD12p0OEXGc1UmJWb7YMKKELImjmd4h14P+LPiEQKzDRr8xdQzFnh/BcC3rpEUCv2hnXI0mL16tkDWXEcG/EBZOVf0vwHQxeA1sVbblLZ0VrJqkmZu2wgM/bupM5fm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CzIbHVHk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CzIbHVHk"
Received: by smtp.kernel.org (Postfix)
	id 27166C2BCB3; Mon, 13 Apr 2026 21:19:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7FB2C2BCAF;
	Mon, 13 Apr 2026 21:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776115198;
	bh=Nv0Lo2AZgi9nazPzIBumHyPNI+rzbMRBuS55QzRHkRs=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=CzIbHVHkw/+VKMfojlBtcUMPekAdK2K0jCSrHbEeV2gkDr0a5rXj0m2yFlhTCYgYG
	 pNx1KWGAxTgDH9/4eDB/H56ymYaXpNZHzleFQwXXH3JT4djR+TGDfwYWRhkp4qm887
	 JNsHOI9JUyBYNBvd1aFJWcI/KhqhgUbk57Zk1riU=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 14/14] Add b4 send configuration
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
In-Reply-To: <20260410-harden-type-checking-v1-14-fcf314d9d748@gmail.com>
References: <20260410-harden-type-checking-v1-0-fcf314d9d748@gmail.com>
 <20260410-harden-type-checking-v1-14-fcf314d9d748@gmail.com>
Date: Mon, 13 Apr 2026 17:19:40 -0400
Message-Id: <177611518002.749969.7597284647765169493.b4-review@b4>
X-Mailer: b4 0.16-dev-62088
X-Developer-Signature: v=1; a=openpgp-sha256; l=579;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=Nv0Lo2AZgi9nazPzIBumHyPNI+rzbMRBuS55QzRHkRs=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGDLvxv5O3SV+u2z6ckHf/Mu9UxL8zMr/Nvhuf73W0PoHu
 9yBQ5xFHaUsDGJcDLJiiixl+2I3BRU+9JBL7zGFmcPKBDKEgYtTACZyoYCRYUKwRsOTZfOOCV1p
 k1X/cbkn8UdlxZI5fK+bS0/82q/QZM/wzz6l1IxZM/nErnVbZm17Pv1gNnuZSv8yrfJf4rPaz+l
 d5wEA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

On Fri, 10 Apr 2026 18:38:05 -0400, Tamir Duberstein <tamird@gmail.com> wrote:
> diff --git a/.b4-config b/.b4-config
> index ad41b6b..1cb97f4 100644
> --- a/.b4-config
> +++ b/.b4-config
> @@ -1,2 +1,8 @@
>  [b4]
> +  midmask = https://lore.kernel.org/%s
> +  linkmask = https://patch.msgid.link/%s
> +  send-series-to = Kernel.org Tools <tools@kernel.org>
> +  send-series-cc = Konstantin Ryabitsev <konstantin@linuxfoundation.org>
> +  send-endpoint-web = https://lkml.kernel.org/_b4_submit
> +  send-prefixes = b4

send-prefixes should be "liblore"

-- 
KR

