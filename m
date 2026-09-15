Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6183A8FE6
	for <tools@linux.kernel.org>; Tue, 15 Sep 2026 20:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789504607; cv=none; b=arPG6Z9xpZ56Fsxrt7xi9lqOs71cjY/Z2fDYzUkBoD7b5biffAabGCz6v4q1Zde3qOLU7Py5tZ7XwufSIQb5KkWjg2kKxY4h0RKH1AMN7Sp0sllTiSiesylZ5r0dtpiqPwLG7DcvzP8Q7uPJrFnTnYScPfEhMjeguJVlQ9CPGcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789504607; c=relaxed/simple;
	bh=bAxJmY1dz61zsDsoUX0kMtaSvZo3aQ7YqQSjoOgzQ2U=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iErwTyl75vfJ8T+MHlEpANFupOeyHUTko8lUTqNeYVA1TqWF5xaEqO6z6FfAGkXt6o1H90jz5/hIQE33nrv8PWpRKDXLc39pZsyaeSIl+Zb8TH/ar270s/OBEy45YjW4wIATwlR/SMV0WKRYWv9UwlNYJgqAEvWZBpr8gBuccB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tYXx+dZi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tYXx+dZi"
Received: by smtp.kernel.org (Postfix)
	id 29B421F00893; Tue, 15 Sep 2026 20:36:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9A201F000FF;
	Tue, 15 Sep 2026 20:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789504603;
	bh=jwQAD72TCH0VqsYopuTNIlaRq5oRsOXQRbdCfz/vzBA=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=tYXx+dZiSgGpyx8sl4a/r1Akg2OQG7o5mbvgxDfUILOtS4+x1VDcC1By82cm5Tyk3
	 GWyIFTEjSDQsPaQ46RqW3ry7qVSiE7tx4k4gu/r9XJn8+RQSAOnmCRuJKZ81THLkcJ
	 iX/wrceqr0AKtObwU5LdPPH7gm3kttXeuJiq80HQ=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org, Konstantin Khorenko <khorenko@virtuozzo.com>
In-Reply-To: <20260904145951.1414701-1-khorenko@virtuozzo.com>
References: <20260904145951.1414701-1-khorenko@virtuozzo.com>
Subject: Re: [PATCH b4 1/2] tui: fix MissingStyle crash under Textual ansi
 themes
Message-Id: <178950434999.53447.14781951874270825013.b4-ty@b4>
Date: Tue, 15 Sep 2026 20:32:29 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1272;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=z/t1j3cqnjsnDCUSdDIqRDcNsiF4sb6ax6S9mmN2jB4=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLJWrok8xrGjqKPPoFJ9z6nf0o1vghYtniBc9jttxfV+g
 R3eztpaHaUsDGJcDLJiiixl+2I3BRU+9JBL7zGFmcPKBDKEgYtTACbC0sTI8CfiRX38ZwFPEb/3
 W5P2rzy29oe64Jmz261fHe25qpvS3c/IsDtFKPnb8gNrdC9LGDl9uFKesftQWUWHuO9054lv7nz
 nYwYA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Fri, 04 Sep 2026 16:59:50 +0200, Konstantin Khorenko wrote:
> tui: fix MissingStyle crash under Textual ansi themes

Applied, thanks!

[1/2] tui: fix MissingStyle crash under Textual ansi themes
      commit: 99687c6f54873d234b49b33322fee011682f1cc9
[2/2] review-tui: read native_ansi_color for the trailer overlay header
      commit: 7e16afe0473cf1a066dc1f5baf348d41f7911665

One thing you may want to consider as a follow-up:

There is one more Rich-invalid keyword left. On every non-ansi
theme (textual-dark, nord, gruvbox, ...) Textual generates
text-muted as 'auto 60%', so after your alpha strip it becomes
'auto', which Rich rejects the same way it rejects 'transparent':

    unable to parse 'auto' as color; 'auto' is not a valid color

It doesn't happen today, because nothing currently reads
ts['text-muted'] -- it is only consumed as the $text-muted CSS
variable, which Textual resolves itself. However, this can become a trap 
the future bug.

It can fold into the same guard:

    if textual_color in ('transparent', 'auto'):
        return 'default'

'auto' means "pick a readable foreground", so 'default' is the
closest good Rich equivalent.

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

