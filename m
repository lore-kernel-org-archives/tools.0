Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE0643BDC8
	for <tools@linux.kernel.org>; Mon,  5 Oct 2026 09:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791191480; cv=none; b=dCAd1vvoOGFQU7+vaoDyMOPKOwlxtlmQR/l56E+ziyqKemYBQkfUjYl24nzDcH4rsglMEDhZyy8dU+RsftI3cCUrFN5dQPTUj2GIlmXIt/53kaxTNy6TK5KiC1nf0BcCkH/XV98tuo6dIMr2D7xMDeSfKG8iMtQCD8zaKKDPkOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791191480; c=relaxed/simple;
	bh=NeWszvqrrprXtDzMsUvZ9slzgzOiF1osmsFQ/qELKAc=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kWXQIz4ZJedjnzXoXXel450/SGjSfqm7dpAWY+c3RqwCeras4z5sy+CRUFrEMlhHHpvCJFtMGgh/F/MgSOkmhkRbjOaJxhg0Aajl8sBgXLzejRKPpV8iQUTCQFsKVWvXlyUGTT/9QttoX21UoMmph6//IhT6BJy7B07F33Gv3Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2NeMKhVt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2NeMKhVt"
Received: by smtp.kernel.org (Postfix)
	id 05A5B1F00899; Mon,  5 Oct 2026 09:11:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B69191F00893;
	Mon,  5 Oct 2026 09:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791191477;
	bh=cyJEAI8ItnkZ/zHvDWNdFH9Oy2w0eMG99RV/KFIEn28=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=2NeMKhVtsrUUAGLx0nzdoh6oKtJp68U7dNSP91PE7d5fPxQ49fE9eK1VnppQxxwVC
	 PGXRBjpUE6sJ0eJyo3g5Ea2oxkP4GyGbXyZafoN5wNfNtxhJghmN3hoQY3H2SQ23ip
	 We6CkteZTHPIbRzlJ1qy3EmGVtA5/U9OT3l442Uc=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Khorenko <khorenko@virtuozzo.com>
In-Reply-To: <20260921-kh-auto-color-v1-1-8bb8fd7d8ecd@virtuozzo.com>
References: <20260921-kh-auto-color-v1-1-8bb8fd7d8ecd@virtuozzo.com>
Subject: Re: [PATCH b4] tui: map Textual's "auto" colour keyword to the
 Rich default
Message-Id: <179119147136.1730306.13717100975677101288.b4-ty@b4>
Date: Mon, 05 Oct 2026 09:11:11 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=351;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=GNrEz8TYeQ6eMncGvPwY1RNuGsZAdzVrpaUyNhTXnOQ=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLIOZ26etmbZbIWMuqZTmc8mvt1/dOs+idpYQYl60TObX
 n6Yt/ejf0cpC4MYF4OsmCJL2b7YTUGFDz3k0ntMYeawMoEMYeDiFICLbGT4wzf/nNbmdW/eTU3e
 mBg0TcS2+sjFO6tZ/CLWL/7HdV9mhiPD/5jYpL1eKh6pxlcNmf4qbJwfuoPdZkHLFYmJOw4w2zA
 d5AEA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Mon, 21 Sep 2026 20:34:09 +0200, Konstantin Khorenko wrote:
> tui: map Textual's "auto" colour keyword to the Rich default

Applied, thanks!

[1/1] tui: map Textual's "auto" colour keyword to the Rich default
      commit: d0a9f1e365d4cb11a90a71477c8aef10309b0ccf

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

