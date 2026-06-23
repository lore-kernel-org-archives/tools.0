Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04DE35AC10
	for <tools@linux.kernel.org>; Tue, 23 Jun 2026 15:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782226819; cv=none; b=adNRCPa0cbcpRW/GbZGE4b4K6dtc/uokdXrrPkEqPGJBy1xNd5NI0aBO5u6ndvAAeWEm7HOGzqQvNxaR30LnneruNhDphGqAONBcJEwY/vqcUx8pOGGcKY92qSkLXQcLUPSRycKqQ+CYyXDxz/6riDGWcfFzcbIhmk3i5Ko5uL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782226819; c=relaxed/simple;
	bh=A5GA48MryqVhv+C7qT2ZP2Gp3T8ZTBdAGHiGqCxGkHk=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dr/igzwPBG2vw7Ej1OpNWlPuDcHjlFFZYgSTsVn6Ik51DNUfhCYG8TcaypoiWbTF5a1WBn9MDR5APdDUfqmzgwuO9ZQ+JDamMZKPpv/VvkkAw1zCO06Rl8Rb7eHDn7YsvgP5QNppbGExNS3f+gDthC7eqVjCLTovDtS1QycSUd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OeW8rvyi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OeW8rvyi"
Received: by smtp.kernel.org (Postfix)
	id 6C34A1F00A3A; Tue, 23 Jun 2026 15:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 287721F000E9;
	Tue, 23 Jun 2026 15:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782226818;
	bh=bbyzFvu3WCxbl3+JLGL3B3XGvxz4GrUaSDFukcvTe4k=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=OeW8rvyij9bbobpUDuiO+oW7DCkGFa/rxuJiZDlXZz2N2tvOu9/h6mZ2bP0C4lPJa
	 AdFAdPWCNVKLITFBeYGTlPJHpADCQ2OlKUtmyriF236o/gyFlL0yxdlBzFeEuqKeW+
	 G5mqlAQNarAK/QQ8NhnQopmC3mKDqdFKkY/zGf7Y=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Christian Brauner <brauner@kernel.org>
In-Reply-To: <20260623-20260623-review-tui-pw-multiselect-v1-0-2470add1453c@kernel.org>
References: <20260623-20260623-review-tui-pw-multiselect-v1-0-2470add1453c@kernel.org>
Subject: Re: [PATCH b4 0/2] review-tui: mark and bulk-set state in the
 Patchwork browser
Message-Id: <178222681371.1476005.11314529355822975586.b4-ty@b4>
Date: Tue, 23 Jun 2026 15:00:13 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=800;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=6I8zOjp3015xxxljFN6Ft6jT8S7QGTFqs/HCjYdI2hs=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLKs5jd2mB0uc3G8qLt421EtuZuX3Jbuc/O+5x6Ytkp1w
 m9m0atpHaUsDGJcDLJiiixl+2I3BRU+9JBL7zGFmcPKBDKEgYtTACaybQ7DP8t3t1TDQo55zne7
 HlzKFsdmKmRwrWThwkfOzzglvVRfXWL472V+OVVE/tor6cwHsYnqhdckFr099Mjw/Lql9Wd2uNt
 e5AQA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Tue, 23 Jun 2026 11:27:04 +0200, Christian Brauner wrote:
> review-tui: mark and bulk-set state in the Patchwork browser
> 
> The Patchwork browser in the review TUI (b4 review -> p) could only set
> the state on the single highlighted series: 's' opened the state picker
> for whatever row the cursor was on. Triaging a batch -- say, marking a
> dozen applied series as Accepted -- meant repeating the same pick once
> per row.
> 
> [...]

Applied, thanks!

[1/2] review-tui: set patchwork state on multiple series at once
      commit: 5f81e26ed7638dc17b2a8a088d06a49851f1b3b8
[2/2] review-tui: test patchwork multi-select and bulk state changes
      commit: 119c1f7b168384a116a832328e0916b9602589e1

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

