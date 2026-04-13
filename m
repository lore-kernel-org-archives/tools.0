Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF98F37AA9F
	for <tools@linux.kernel.org>; Mon, 13 Apr 2026 21:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776115196; cv=none; b=bXlc/bK8X8ySzMwc39g4/DxfNJ0vqAVDrVELwZ1/x3cPrVnsnhpgtADrrDIEISwDt5aPSlDbCdxaILmuWBVfSQE5SusLMlViw3asHQuxqjmOwpcRYNIJTirXRnlDk4kSL03uOYhERWNFxiL9osg7Fx3nC82gy3HIcdOvuIREl3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776115196; c=relaxed/simple;
	bh=diU9lTMEfq+thxz/R9bzk76rjZSJ0k+OURlMHe10YPU=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=EqVmflKoDfyq6EWGO1OuL+HHUgeK9afoShLkSMTHQ0QOm9sWejYuPs9zx2V3qKtPwAy+ebdoBmzUtP5waEYsOqPtktK091NADPGG7nayHg8Oy6Snb5XZVgEO2KXLhK8XIEUSj69e4Wi5cyvPr4iGe1RBOTLGFQxssXQkIERnoJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AKVex+q8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AKVex+q8"
Received: by smtp.kernel.org (Postfix)
	id A570BC2BCB6; Mon, 13 Apr 2026 21:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51DCEC2BCB5;
	Mon, 13 Apr 2026 21:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776115196;
	bh=diU9lTMEfq+thxz/R9bzk76rjZSJ0k+OURlMHe10YPU=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=AKVex+q8VX72wUXvyI7qh18JXldTumbC2pLzZHDEvAXEPv9/6PQoi5JkwebjAxhVP
	 8GXRyHsGTCc4Hna/0PJeBOabeXNhyloJ7VYI+COGhuPg+wRoJ+/SdPhsXFG9cPzkPs
	 gcC59zeI0y/LxogrUWZQOS2KrAEACImRlrSbtq7g=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 06/14] Replace HTTP session mocks with responses
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
In-Reply-To: <20260410-harden-type-checking-v1-6-fcf314d9d748@gmail.com>
References: <20260410-harden-type-checking-v1-0-fcf314d9d748@gmail.com>
 <20260410-harden-type-checking-v1-6-fcf314d9d748@gmail.com>
Date: Mon, 13 Apr 2026 17:19:39 -0400
Message-Id: <177611517999.749969.14323430684565098987.b4-review@b4>
X-Mailer: b4 0.16-dev-62088
X-Developer-Signature: v=1; a=openpgp-sha256; l=1468;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=diU9lTMEfq+thxz/R9bzk76rjZSJ0k+OURlMHe10YPU=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGDLvxv6c/vZO/74yzrMPjRR4foa5NBw6VLhdj1HpT9mqE
 P9tNTx6HaUsDGJcDLJiiixl+2I3BRU+9JBL7zGFmcPKBDKEgYtTACYiHMXwP9Q8Pda6WPDiqc4m
 vZarS7fvuLnZIEbsLfcD5iv1c1XnHGJkuPOqYPpr4Z8LMqKijcUnzbr98rtRxrslhj/eWygl2j+
 7xQoA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

On Fri, 10 Apr 2026 18:37:57 -0400, Tamir Duberstein <tamird@gmail.com> wrote:
> diff --git a/tests/test_cache.py b/tests/test_cache.py
> index b822e7c..2313a6b 100644
> --- a/tests/test_cache.py
> +++ b/tests/test_cache.py
> @@ -121,109 +121,154 @@ class TestProperties:
> [ ... skip 161 lines ... ]
> -
> -        node.get_mbox_by_msgid('test@example.com')
> -        # tmp_path should be empty since we didn't set cache_dir to it
> -        assert list(tmp_path.iterdir()) == []
> +        with responses.RequestsMock() as rsps:
> +            """When cache_dir is None, no files are written."""

Nitpick, but I think you meant this as a comment, not a docstring.

> [ ... skip 17 lines ... ]
> -        node._fetch_thread_since('test@example.com', 'dt:20240101..')
> -        node._fetch_thread_since('test@example.com', 'dt:20240101..')
> -        # Both calls should hit the network
> -        assert mock_session.post.call_count == 2
> +        with responses.RequestsMock() as rsps:
> +            """_fetch_thread_since should NOT be cached."""

And here.

> [ ... skip 23 lines ... ]
> -        with pytest.raises(RemoteError):
> -            node.get_mbox_by_msgid('bad@example.com')
> -        # No cache file should be written
> -        assert list(tmp_path.glob('*.lore.cache')) == []
> +        with responses.RequestsMock() as rsps:
> +            """Network errors should not be cached."""

And here. :)

-- 
KR

