Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96383AE708
	for <tools@linux.kernel.org>; Fri,  6 Mar 2026 16:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772813422; cv=none; b=aWABbAJFFU2YmvMSmsCllzrkz0Q2hjaTId1PjByJcbeOU/I0DXVtW0iY0mG0/5fBKrn3l4YuZf3YFL6ails7t+Y14BBYG2wZF3ehsrhHk1UkKoQv28VhZxnu2iRnxB7nm86+e54jcbxfldRSlaDV2/1qy2U0JXeqwPJnZQ+/8mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772813422; c=relaxed/simple;
	bh=rdNcgn4rpeFrFLpfRhl17/KeDV4R02U0B5bI0QNrpj0=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=ekviUV6w9zTLl9MM/EEGj4GbQsGlIdkbYR36GH/yJzOlB65H/xKhpewiQPXJRf3wW9Ww6EIMny06/IkKVLtb769KsVXF/bMJG9FL72X4miNX37uIKT+5IqLKSDdxAKy+uttAFfq0/adKH5IedXbmsPLxZCV/TBTsMCeAlW42gX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=I/VFSrq+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="I/VFSrq+"
Received: by smtp.kernel.org (Postfix)
	id 6C26CC2BC87; Fri,  6 Mar 2026 16:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFA1EC4CEF7;
	Fri,  6 Mar 2026 16:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772813422;
	bh=rdNcgn4rpeFrFLpfRhl17/KeDV4R02U0B5bI0QNrpj0=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=I/VFSrq+LyCggDy/Cbaif2VgVxbAbFYRkvjXK7tz2P5MAB5kuSwdYpZ0quUswqBHQ
	 /ghl/3jdf88M03dneUYh3tWMwML5o25Abj3FW6jwbaN5AKff3DcIVnezy5cS8/0dFj
	 dpIog6JfUR9Es6eUTT1uxkX8epMNwY6nCdBsheXg=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH b4 1/3] shazam: refactor git_fetch_am_into_repo for
 deterministic worktree
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Christian Brauner <christian@amutable.com>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Christian Brauner <brauner@kernel.org>
In-Reply-To: <20260306-master-v1-1-5a4b9cbe11d7@kernel.org>
References: <20260306-master-v1-0-5a4b9cbe11d7@kernel.org>
 <20260306-master-v1-1-5a4b9cbe11d7@kernel.org>
Date: Fri, 06 Mar 2026 11:10:18 -0500
Message-Id: <177281341841.2006359.7114808279011252381@lemur>
X-Mailer: b4 0.15-dev-9243a
X-Developer-Signature: v=1; a=openpgp-sha256; l=967;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=rdNcgn4rpeFrFLpfRhl17/KeDV4R02U0B5bI0QNrpj0=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGDJX/clVeft97+0mhrzZ/5QWP9i+n1PhU14Zt1QO547O1
 VdEZ5w631HKwiDGxSArpshSti92U1DhQw+59B5TmDmsTCBDGLg4BWAi890Z/sr9+bu9O+eDQbSZ
 87+qP42XVC4ddqtisXVv7vLNWmzeUMfwh//hl1vTgw4FRedusVm4uy7c8vXROL/S9Wx3l2jb3Uh
 O4wcA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

On Fri, 06 Mar 2026 12:52:24 +0100, Christian Brauner <brauner@kernel.org> wrote:
> Co-developed-by: Claude Opus 4.6 <noreply@anthropic.com>
> Signed-off-by: Christian Brauner <brauner@kernel.org>

I don't have general objections to the code, but I'm not fond of using 
the Co-developed-by: line as above, because this will *always* add the 
agent's fake noreply address to all communication. I recommend you add 
the following to your ~/.claude/CLAUDE.md:

|  **Agent signoff:**
|
|  Do NOT add a Co-developed-by: trailer to commit messages. This may
|  interfere with tooling and automation used by many projects. Instead,
|  add an Assisted-by: trailer with your exact model identifier. This
|  identifier can be found in the system information by checking the
|  agent model being used. E.g.:
|
|  Assisted-by: claude-sonnet-4-5-20250929

This still accomplishes the same, and avoids the problem of useless 
email being generated.

-- 
KR

