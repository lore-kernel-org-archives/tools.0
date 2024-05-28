Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4D3CA6B
	for <tools@linux.kernel.org>; Tue, 28 May 2024 19:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716924028; cv=none; b=Mnh4XpA/Q68a+eK8CM9xlay4weGpSSu+5Be0OM4FKPdIxnFxwpWibiLUnQjgIZijD1+sYnjF03K/l5sn//iCKqIwJDGasp1JiJkOvi4L1xQ6vB7hQHkU6Mcy3soS5ExhL30nGBsMJddrDUxF08fZJ2Q8X5rmX9R7EEyuK0pkN6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716924028; c=relaxed/simple;
	bh=tpC3tLwrFL69OBWHGADKC2JTBbjL5CjDhgNh+GZhNK4=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=TlnXYvRh+Wo6UdRlSzwd0Pv6pJh46aPJfGtjhCucyJG/MhfrPB7pGf2x5SPsJOQxuuUo3fXGQY6toMWIczb5YzwAzPykoov7tnbyeAGjp3/vRjOa5nXNDOzQ/JOlqev5YrFBwgYHbDRZbC/L986UQkQ20SK9VbRYl6J6mnANs28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OPs/Ahy/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OPs/Ahy/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id ED52BC3277B;
	Tue, 28 May 2024 19:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716924028;
	bh=tpC3tLwrFL69OBWHGADKC2JTBbjL5CjDhgNh+GZhNK4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=OPs/Ahy/zWTk6bLnM1T1OzmorZT8+eOa+qnNsDcGfWJOvQbxKsHqPe4+aebDr4pwu
	 jJ4hnzqxyGwSPiSGedYRbC74avEdBrWfewmwj5LKBab4kayPgNt9dQJ4wv/+iLSEIr
	 Yhg2Y57MAntjPpcINYfCWDrd7ucchVfIp1856RDFvi8Yji0vv7FesSJ0IPkpBE9U12
	 OW6emSwAT247lyD40/yp+JpE5WDGopKAS6uAXN+0AaMO6kaiBKCbM5iCJc5yWYM0LK
	 8geRZBfEypdOk4ULt2cpu6AUQ61hrxDnXZtC6EHX/Lzr9H7QWUgXHtPE18DPJ8qlvl
	 vUoPnoksdcTEQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CE71BC4361C;
	Tue, 28 May 2024 19:20:27 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: konstantin@linuxfoundation.org, broonie@kernel.org, 
 tools@linux.kernel.org
Message-ID: <20240528-b218910-db9853cef3a7@bugzilla.kernel.org>
In-Reply-To: <177fedb6-241a-420c-ab5f-8b7ae4d7acd9@sirena.org.uk>
References: <177fedb6-241a-420c-ab5f-8b7ae4d7acd9@sirena.org.uk>
Subject: Re: Single patch ranges no longer understood
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Tue, 28 May 2024 19:20:27 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=218910

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

