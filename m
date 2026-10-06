Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5943DC85B
	for <tools@linux.kernel.org>; Tue,  6 Oct 2026 15:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791300829; cv=none; b=VPTH7R9pLeNZ/3afyPWGdQYLPoJEQh/jl3BJ0OfHjdkO1gZqryUarfd5sg/lIPqclu9MgGxtOFj2CWnL3EUGyYldY3P89FSdn6vQMnVPpuRDor0aLtEyoOZOwCwMWU6yVtMmfgkJOEIJaPhP3HpbZzjWe+zaXE7rBIE6j3ZzUbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791300829; c=relaxed/simple;
	bh=CD70ICqvUTKjVjPzhzgeNMNNDfunmKhV9b9hd1+86QM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kH3iKbvr9uQEycY1kLwZHF2sSzTxOV9bvsQURw7EdeeQbgM8wRRHO4YEQCpaRn7sg2aimmIrRZu12UIG9OaCo5Hhi1AjGYeCAKSoqRryO/FNODKbUF2MDrpP/sAkR42JhKGaTiBdA2tXR3jmvsnw0erF0LPERA85T7XB2zNX0x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LofcBIFk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LofcBIFk"
Received: by smtp.kernel.org (Postfix)
	id 5BBA41F0089D; Tue,  6 Oct 2026 15:33:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E60E01F0089B;
	Tue,  6 Oct 2026 15:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791300828;
	bh=BBhOUDfFZbaCyblJRswa/KFtukUl8GXHV2hHLkGSowY=;
	h=Date:From:To:Subject;
	b=LofcBIFkrPWjn4eWyUEvHEFSZdoTLfxiq/ersWqOr7tIDMPm0F2MqLoiFbURya8qz
	 vLUz0sk1wcd4lamH9ZlhQG2GxgWEFqRPyWdCCPNhngUk3cGmFCOJnWO4z0cAKytOBR
	 ESV9eJ4dpiDRbVbUoki+MmQkJJONSoLFw/C3xpcRUTqXI+HQepi6CBl1tFsx5Cmih2
	 bkJkGy7QI9dhzy84nWR24c4+tCj+6itdjbQw1t0K7ncaPAOCp814e6ZeBKctKRxGCJ
	 81ILfF8Yi8foi3/3c+1DyGT557YGmM1+rbhMQ08+XDA+5hmF1h+xr4YIDH1mPZGlWR
	 9yHL2GnrLDe9w==
Date: Tue, 6 Oct 2026 15:33:46 +0000
From: Konstantin Ryabitsev <mricon@kernel.org>
To: users@kernel.org, tools@kernel.org
Subject: korgalore 0.7.0 is available
Message-ID: <asUT_3H-KYm9raJz@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi, all:

Korgalore v0.7.0 is now available with digest deliveries, optional thread
summaries, mirror failover for all lore requests, and many bug fixes. It also
installs on stock Debian stable and EL10 again.

New features
------------

Digest deliveries (beta):

Busy lists can get thousands of  messages a day. If you want to follow a list
without getting all of it in your inbox, set mode = 'digest' on a delivery and
get one email per day or week instead:

    [deliveries.lkml-digest]
    feed = 'lkml'
    target = 'personal'
    mode = 'digest'
    schedule = 'daily'    # or 'weekly'
    send_at = '07:00'

Each thread in the digest shows its patch count, review trailers, a lore link,
and the "kgl yank" / "kgl track add" commands to grab it. Set
digest_format = 'plain' or 'html' if you only want one of the two parts.
"kgl pull" sends any digests whenever they are due, but you can also use "kgl
digest" to send them separately from the main process.

Summarized digests (experimental):

Set summarizer = 'NAME' to add a short summary of each thread, written by a
language model you choose: any OpenAI-compatible server (Ollama, llama.cpp,
vLLM, etc.) or a command such as "llm". Each thread will receive an
AI-generated summary, clearly marked as machine-generated.

More info on digests and summarizers:
https://korgalore.docs.kernel.org/en/latest/digests.html

Full changelog and documentation:

    https://korgalore.docs.kernel.org/

Source repository:

    https://git.kernel.org/pub/scm/utils/korgalore/korgalore.git

Install via pipx:

    pipx install korgalore

Thanks to the following people for patches, suggestions and reports addressed
in this release:

- Ard Biesheuvel
- Borislav Petkov
- Catalin Iacob
- Clément Le Goffic

-K
