Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A12BD299
	for <tools@linux.kernel.org>; Tue, 21 May 2024 17:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716312730; cv=none; b=k3u962dgXDOtYSZTXDoIh7VPFVjyYLtn++p1V/dEJim/9ByhckKXctzozSNHi0AMxKgt85lKdYZK9greCvL/oENVVavajGhgqLQ2GxXGUZ1kdI+xfzhHygayspdWJxrEYGreJ74LMCFdNDYujM2NoWiPgC78m9+J13PwIAt4gzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716312730; c=relaxed/simple;
	bh=GgwpoY9RPoE+56kUPUdmUyUa4nf7AX01R40zwkR3fbA=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QI+J/6nyIvBkA8rQ816XgjXUPu1M+IN5NPCsPt/gS3x1ubAicn8dEu54KhY/13r++GPK1XZaGXQehOGPbDvIzR3jrbR4nazHiY0gxZ4A89cYLWBMe/gYpS3DMZ/BHg7Xa2ToJGqEZ19CZ03uzmTRCCluLiDlGeFqUbEeE3odXaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MqOoNcMh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MqOoNcMh"
Received: by smtp.kernel.org (Postfix)
	id D8D9DC32782; Tue, 21 May 2024 17:32:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B111C2BD11;
	Tue, 21 May 2024 17:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1716312729;
	bh=GgwpoY9RPoE+56kUPUdmUyUa4nf7AX01R40zwkR3fbA=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=MqOoNcMh4vL/YuyCrPQeURiryTB8MxxfbCFu+jAXwaGzJqDu3/lfxv6d27yZRTJ5o
	 lW3DRFXopuAvijFH3p/IbCzkdE/ua0hglEe7N+E3ndHMISjwVhaJ0SOGhskRYg8P4t
	 gWRTiY8UaZGbtKbdCqHndPuMsQarDEqpMcXWxEvs=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
In-Reply-To: <20240521-fix-check-deps-v1-0-d149bf40e7ee@bootlin.com>
References: <20240521-fix-check-deps-v1-0-d149bf40e7ee@bootlin.com>
Subject: Re: [PATCH b4 0/2] get_info and check_deps fixes
Message-Id: <171631272944.1872994.7178400745357286134.b4-ty@linuxfoundation.org>
Date: Tue, 21 May 2024 13:32:09 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-b6b73


On Tue, 21 May 2024 16:41:36 +0200, Louis Chauvet wrote:
> The dictionary returned by get_info() does not contain all the keys (for
> example, "needs-checking" is only defined if there are some check commands
> AND b4 prep --check was executed). Instead of adding to the complexity of
> this function, I rewrote it using literal dictionary declaration, making
> it impossible to miss a member and easier to read.
> 
> The second issue is with check-deps, when using the cover-letter strategy,
> as the cover letter is an empty commit, the git am command was failing. I
> simply skipped this empty commit to avoid errors in git am.
> 
> [...]

Applied, thanks!

[1/2] ez: Ensure that all the info dict keys are defined
      commit: a7db8293793cc960482bb5a8093deed04498e0c7
[2/2] ez: Fix check-deps when strategy is commit
      commit: 8a47064cfdfac42d9f172f4163ff8fdc1b9fb970

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

