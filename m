Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269FC20C31E
	for <tools@linux.kernel.org>; Fri, 25 Oct 2024 20:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729889862; cv=none; b=dROgJtg2mo/2djzitlzZIefmExsVGolqFrro1NbWCGMVNCe15okVT8UIpMVfsc5vTEGElS5Osv4SWLLuv05l2qYE7EQo3PSDcsKIRWJzgQ+sAgYtktC4zyjWFVDbR+XLTIQ7RETGgp/DbCgqyvZHrJxqFOyxRvtZ0M2kleTRKPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729889862; c=relaxed/simple;
	bh=92J1/l3fxtH5r/pWLmJ3Zk56XjBai612StveYYPKbGw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=cJOnLvJRa+MJLg5phsD+cwKKanXnK9PzmyEyjZcb3bBaP7jeiW6/Vp5WDUzJMMZ1oFKVpu8bXA8x+jkEPBUFB69vVrZa5bS9+5xF4ZAnIOsrZhfs0sAGa/f/BhzqRg9mfUAwu/0wxN7EczYn1SSqv+eMr9aOHZQRF3a46eOaebA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mKtkxIfQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mKtkxIfQ"
Received: by smtp.kernel.org (Postfix)
	id AEE9BC4CECC; Fri, 25 Oct 2024 20:57:40 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D1F50C4CEC3
	for <tools@kernel.org>; Fri, 25 Oct 2024 20:57:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D1F50C4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb584a8f81so24504761fa.3
        for <tools@kernel.org>; Fri, 25 Oct 2024 13:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729889858; x=1730494658; darn=kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=92J1/l3fxtH5r/pWLmJ3Zk56XjBai612StveYYPKbGw=;
        b=mKtkxIfQP5L5DWJeMj9MEo1inBQ6vzGxMx47N6VdWF7UfVWQpNIUcJATz3Os9idAtC
         pTb3EKLwwRDk5E5Lxyla2nVZ+o0nib4ttYf79m8dNOEzCPupa9JLSF9fnwtGGSIdEZBB
         gsqxTm0sOUqF1rT23JNX67JsnTk0LkhXE4u/VGJd4DGnoD9GmPgG0g4ldbGdlG0G67DA
         EgzCMWBFwzO1rOds0aLmJ+n4wXrtrvgNBGPOEcYbwl4R78QFUVFZmhOf1kBGyANAGIkB
         s/+GOcLgFjB3cUz/bPRMkF2haP2WkLSuODdmdCc1zC17mxP+whysiGFW4MMeSEjW7/R+
         tznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729889858; x=1730494658;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=92J1/l3fxtH5r/pWLmJ3Zk56XjBai612StveYYPKbGw=;
        b=QFJ1ebNg9oeKk+hNWSHchP8Q+OJr4z9Gge21Lr/IVd5vM9XTCx0v8MquTPaalTJeV0
         aIY65CBp6/C2QlczrR6O6FnPjrORyrVH3gixOiimdLx/R1u8XOQdq44MGypBXjgfD3w+
         MwXwLxX+zewQceu3qJUO6eOAEAmjlrA+1klx+eWqtMcvdUgI25bdmzKBGkVA9nX+13IT
         wmoz8F+d4jajRFNoci5I3fvps4gOny1We4EzfxMYVTpJKzMXIEuHYVXCVTria1WftSlj
         TkZlV+6FN6Qd0bKwdYDaCOxBZrKOiZmlnpMTjxDlMq/O80vRbT0sf+F0JFDkDNYiq5Iy
         2P+g==
X-Gm-Message-State: AOJu0YwFgV3/buzMML2h5jLAF4guett+2YcylUI+2X3h0ocPWH4JML8g
	iyvfbsfPJq5BSH/QcaRzJJ3UV/6bRv3wvLEdSfDPcz/7Zu39vb2FhGbBvuj3jWyghrYWXtUbOHS
	Dn5zdkmZASOAjZ57QEgXO6ScZcoOC6/+S
X-Google-Smtp-Source: AGHT+IEPfJP3qxp9pdLHpYQB2K/dbDynXmSCx8r5F5jWWdKh3QJcJoinc+DS9/yDoTP4HfFJ8mfvcv4Ukdwx3BgDems=
X-Received: by 2002:a05:651c:1546:b0:2fa:c18c:faba with SMTP id
 38308e7fff4ca-2fcbe07ac05mr2983951fa.30.1729889857424; Fri, 25 Oct 2024
 13:57:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 25 Oct 2024 16:57:01 -0400
Message-ID: <CAJ-ks9=ztzVopy2w1ggR+-xAyc_CigGWKn4vVDy1sWoMQUUaSg@mail.gmail.com>
Subject: b4: b4 send --resend doesn't provide for updating stale email addresses
To: "Kernel.org Tools" <tools@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello, thanks for making b4!

As far as I can tell, it isn't possible to replace an email address
when resending patches - this is a problem because people change their
email addresses. I ran into this problem recently[0] and had to use
`-o` and manually edit the resulting eml file. Passing `--to` allows
adding recipients, but not removing.

Perhaps I am holding it wrong? Thanks in advance for your help.
Tamir

[0] https://lore.kernel.org/all/20241019-checkpatch-fixes-commit-v1-1-0d0cde18ce69@gmail.com/T/#u
