Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC0137AA9F
	for <tools@linux.kernel.org>; Mon, 13 Apr 2026 21:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776115197; cv=none; b=M+hlgjxmYTossUXioE6fBNmVrLOANlxl1B3n5ThwMppvMHvkWjimvPrcxAuoWiuO3qAuQsfODKDzTjJcyHamXZNeWNWlY7Y03YUG/YlEidpEqXbSDRLyJcegC6Cd+D6hq1f2EfXyr8uC0CE+uS0yP/htevX0lveUKdNgEs011JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776115197; c=relaxed/simple;
	bh=kmtu287Myh3fp5njHzbWV8UZuIzQe+g9O+jRyV0zedk=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=mTxoFHgm08STxDq3F+WvEycTQ8V5JJ6X815MjWJu8wBbt4+LoCy1SJucg9GZ23tIp3WiNNzaHuKSLFe8Xe4f4rd42Dyw5zZRG+Wrem/OkIgDaDfDbXQ2sd0EEDxsWV8BHT9D1mkZBvaIiYN9O/KKduF+RtI9BM1XZjJeUJSnjrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xX40mqtH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xX40mqtH"
Received: by smtp.kernel.org (Postfix)
	id 288CCC2BCB5; Mon, 13 Apr 2026 21:19:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8FFDC2BCB3;
	Mon, 13 Apr 2026 21:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776115197;
	bh=kmtu287Myh3fp5njHzbWV8UZuIzQe+g9O+jRyV0zedk=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=xX40mqtHhfTrIPqz/kbET3miuitlhKCKMsHUV1Bka1QqxAMUeYOzclvj+f5FP12XX
	 qt5Sq+LBg3J4tr1A8ywBTGiz1N+Rf81SQDl/8Lht49j02LcMNgI4Ye7ur7K0nTeQ65
	 X5T9qoqL2zcpdgRxPo2LDR562GOdwCILQKS+UJ+A=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 09/14] Type from_git_config keyword arguments
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
In-Reply-To: <20260410-harden-type-checking-v1-9-fcf314d9d748@gmail.com>
References: <20260410-harden-type-checking-v1-0-fcf314d9d748@gmail.com>
 <20260410-harden-type-checking-v1-9-fcf314d9d748@gmail.com>
Date: Mon, 13 Apr 2026 17:19:40 -0400
Message-Id: <177611518000.749969.5782660783825500556.b4-review@b4>
X-Mailer: b4 0.16-dev-62088
X-Developer-Signature: v=1; a=openpgp-sha256; l=823;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=kmtu287Myh3fp5njHzbWV8UZuIzQe+g9O+jRyV0zedk=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGDLvxv70Ys5JiCrP5frn73HPeaaS94v+nAmzTCcvvxPo9
 fzvhf5pHaUsDGJcDLJiiixl+2I3BRU+9JBL7zGFmcPKBDKEgYtTACYiaMnwT2vdMvtc/pV3plnG
 z7dT/mGfP7HO9ENZuM+J0+0mf3dsPMvIsHHB/Eyxwn+qywoY2+7eVfn7+NZf8bXlu+O+tNo+XpC
 8jBkA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

On Fri, 10 Apr 2026 18:38:00 -0400, Tamir Duberstein <tamird@gmail.com> wrote:
> diff --git a/src/liblore/node.py b/src/liblore/node.py
> index 1b0463e..4835169 100644
> --- a/src/liblore/node.py
> +++ b/src/liblore/node.py
> @@ -29,6 +30,19 @@ from liblore.utils import (
>  
>  logger = logging.getLogger(__name__)
>  
> +if TYPE_CHECKING:
> +    from typing_extensions import Unpack
> +
> +
> +class _LoreNodeInitKwargs(TypedDict, total=False):
> +    fallback_urls: list[str] | None
> +    auto_probe: bool
> +    probe_timeout: float
> +    probe_ttl: int
> +    add_auth_headers: bool
> +    cache_dir: str

`LoreNode.__init__` accepts `cache_dir: str | None`. This should be
`cache_dir: str | None` to match, otherwise `from_git_config(cache_dir=None)`
is going to be problematic.

-- 
KR

