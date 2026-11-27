Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795785064;
	b=UMC3f1BvT/S5e4V1OqL7q7LTtZIt7qJ+Gcri335yMPvfV51pMYn5HDU5HLHIZR4w9F1X
	 WFAXGG9hskzKmu/6y0NSthxVUaphfMSyLzil0Q0CJOgd7ps3VxtqjOv91cnAcPBTKxTvW
	 v/CnPZPoY3DhrBfbSYxMoySW5CXNCmQR8BBBgO+FR/APEJxJQtSeUCB+Nf6CmOPHCGUVl
	 F/e8DMmvxT2/pIXIsCqPy/W1HT4okpf/ry+rypCdCxQ7rKHIVbD3tnMgJlJl1SGG55h5p
	 YR902Btf3eCz41rylv+VNgx6vuh0dSrpRNX8qr+zQgEBcmZbKcTjh6lXrgsfnLQlzMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785064;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=QEbGpmw69znx0BrzK0qohQ0axjwSqcP/PmhoDr48RLw=;
	b=uhUtinXHHPf58WizMAbGVGPzrHmMpM2fWZao6f0MI2hkLFB3ARRd5qd94nFneOfnpHZ0
	 D7x6YvBKYXpetBPgGo9Ogi22BRuCkikJzdD+sJpjv1PLGOC0no82n1wVVqvWYfXliTPaS
	 pmImsj64euwRy18+dqhbA0361HfpNJ21eerNLQ1iub15qbxCbIdJouoKgEmxHW7S3n3Jg
	 C3yljPfK+FnPcLIjqew6bceyOdehW94si79B++f9fvYkN4AvWHdCQADe52YL9HUHJ1skx
	 ctf7WLiFRbuYvi2A3ClMR/KY1PHjJkZZD6SwZz+dix4h2bS+VpkiJNi7jXnm8lcDhWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=AOheQPFE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46758606A31F
	for <tools@linux.kernel.org>; Fri, 27 Nov 2026 13:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=AOheQPFE
Received: by smtp.kernel.org (Postfix)
	id BC0F61F00898; Fri, 27 Nov 2026 13:11:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795785063;
	b=iCfgtOx0IB1kPK6YtEW4HrwTPFtjaWGbj5UvqzIF3tpQpN+7YC7EOlSG+zTj2l6lIieb
	 eRTpMerSSIj/PFpfcosdYLRn4pubqJ/H66ePDB1wmLG/Tx8dyffowq8Ynt1HSgdYOfQIT
	 TPIz5J3Qyvn3O4XaUHQNu2ETfGmrkPl6ZZJvN5aZdjoNpNb8TbPR3m+Z0GnTZ+9WsXolg
	 U8nbzI785zTNtGRpOFPwnQ1urQxCHIqCkU4WqLD4MGmw7XjGQnIpLY2+27fV9KXjz1lDX
	 TfovemysyOtEdGi9Q74sMJpH++XTTClTVm5cID0wU0+eGjnk3gAmlDoqkGPmEzWAelw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795785063;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=QEbGpmw69znx0BrzK0qohQ0axjwSqcP/PmhoDr48RLw=;
	b=x1/upByyLm6rPUDOzg5mMZyhbOzWFdf4nIXp8cvbEhP60mJmPpTjpHE2GxjAKKS3ghAD
	 oTcuGX6zuumXEFFxKpfdNnRueyQXOaXtu8mNQPjzUvq+B8Bf0J1Z8iJvSQ/ZDOPSnscVK
	 bb/R5an+6N2QxhRG6Li777r6DiyS8ZZ4S2GdL6VLrx7ANU/yAl3tnTe3HeFC2K/A3W/LZ
	 syFIT4xiWXDV5b6K8qfzt3dDHOUMNjgtV/Jvu3ebji440sjF8u1cwbyiAhusxJ+Z9lnfg
	 0GzZc3CmkaYBW0rCaMOGss15zIUZqa7i02N8DRJfzCGMrnSZGNKNpIwBMBHyZoougZA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=AOheQPFE;
	dmarc=pass header.from=9elements.com;
	spf=pass smtp.mailfrom=9elements.com;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F14D31F0089C
	for <tools@kernel.org>; Fri, 27 Nov 2026 13:10:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=AOheQPFE
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org F14D31F0089C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=9elements.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so7381729f8f.1
        for <tools@kernel.org>; Fri, 27 Nov 2026 05:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1795785054; x=1796389854; darn=kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QEbGpmw69znx0BrzK0qohQ0axjwSqcP/PmhoDr48RLw=;
        b=AOheQPFEpOBbDvAKwl2MFz6knf7GZKdNUCN/enSwxZDrifiGtDMWuAtZfpMJVi/gY1
         Jiz04wXt7Oww1BE/w7xhvXLMSKNcn/k2LXp/kol/X64L74h5UGjCrQz3k/7FFhMIGZyv
         6L36TLuyLMxKWj7XuTWPRHrXYevvN9V8GRFWi4Ij1Z6f0GxODsa/OiGL4hLLPu7PzI9a
         b2+YTyIaESSykKHHWEDrTPE0aRQbnDtoDWwsV00DbpcKMUKHCzQjDPjBPYQuOr0FDFtW
         3i1mNFvdSEz3NiYKtjxDg6I1OW6+3WX821rRWduhNDqoD0UiR5VnGETt9OwFH4pvRGkx
         2vgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795785054; x=1796389854;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QEbGpmw69znx0BrzK0qohQ0axjwSqcP/PmhoDr48RLw=;
        b=KHk7GJydb+RcU/6qrb6XvcNfklRCp1iTTt0KqrNknj1CpI0RFlqSdGeYGJSaCYOSJB
         Ah8IVczauW+6q3LduUv8/QLRqqoSrltwB8LgoYpR6i/EG3bzV6rPzdgPzaMYUBu8a5E8
         KDJyM2PR/8zsDTSyWyb108tm85ezreVtukkhrrQCb9V8Tq9/f08xvq+ukKpOfElJ+GnM
         V33lesrvMcpwzf/6q+BJBtT2/MZA5pF6ntHgPZCUWgeFgNECcmByOxyGCU5Hx9BRrhVl
         xUosqpNcpdj9eUdhZFlF/b24UiKXHpOf/XeJjha3AXEFD5behcjf9dTYFL+TrbvJWylP
         OHPw==
X-Gm-Message-State: APuU4Z/zgxTTWsT5XrjmTfxWESx13qt8clPfLOW0NQYSOF6sheSd5oac
	1QNGSOy12NJcRNnUX5t96rjLE1IVBqfZe8elOqVZhn6wAE/7F2KnW7lLwBwtwoIOyHI=
X-Gm-Gg: AZFdTZfiEf2y/oayVfcDfKWC2zGzVtsRiV4tGPEM9sa74Josvwj+OdeCNbs+PNgi6Zx
	1pF7zhx22cZlJMGAQfW24938lA0po5AHRQZDE+um63K6+GNUcNY2hv0Jz2CcQ+7tKVbcdWOgeV2
	cY7or0sLy+jxKM6CCEjf/jAtkZ84CtwH8SUOsvPVkcS6mi6E00cU+nVYylzgJFDYJYj/1kadpbm
	ayPAw18W8UvHAPDtiUpca4K5YpdQfOBL+hi8J2rJegZNYz+k4UjSc4ZlGl5040o1JU9eTPff7bp
	TVacNO571J2m4ga5BGGNKSFkmAfAskYXEDozGpw/BJ9124PvLdN8a62VmkN5wwcb3AvdjTCm/aP
	4fxqKg4uBRucATCc5brvOJsN5kc67FHubYWwA7t60QejAk0y/6tqJEAhhuA6OHc+YZptixmH6It
	VxJK7RnYZ7hzpG+DEyBCvOEs7LeuHiSGj5eFCb941HUQW3Tqd+QOok5KumTzmRFkjXqp2FIQd5s
	qP+6ff1CTDfEkqemEzqlMSrzpKV2r8VFO6Un3L0F1C42TdzQEVLhMsJ7kPasBJrzkMitfvryjFj
	G+wwYmTDtsCduBSVFZ2QUeiTuVw3dxxXRRdkCKR4gOV6b0Fk46a4v+L5XV6oznAMsau8j8wTfuV
	QH5pU5vsiqQwUTTzPN1fgYtl4Zg==
X-Received: by 2002:a05:6000:60e:b0:49c:fde4:1af5 with SMTP id ffacd0b85a97d-4abb9de7e8bmr45848097f8f.54.1795785053622;
        Fri, 27 Nov 2026 05:10:53 -0800 (PST)
Received: from [10.24.10.70] (p200300e66714e50004d65da9f76f2533.dip0.t-ipconnect.de. [2003:e6:6714:e500:4d6:5da9:f76f:2533])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2e6dsm45531177f8f.6.2026.11.27.05.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:10:53 -0800 (PST)
From: Tan Siewert <tan.siewert@9elements.com>
Date: Fri, 27 Nov 2026 14:10:52 +0100
Subject: [PATCH RESEND b4] shell: copy zshenv and zprofile if it is zsh
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-zshenv-v1-1-9e41c65abeec@9elements.com>
To: tools@kernel.org
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tan Siewert <tan.siewert@9elements.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795785052; l=2177;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=3zZOzIOCPaPSyxlDuRgsJstq1ECS6nWcz2tDTVDR/hI=;
 b=ja8nhqatahjTzwqoYCANWn65w0Jr6csM8dNgLezVetxHe0X8LWEJc1w01TZVjS4h5zg0B+Sl1
 B4sOytMp0daCEd3teFcRSjme0tNBVDIB0j5e+uUSuC45SjRPpA1GR9o
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=

ZDOTDIR gets overwritten to a temporary directory that has a generated
zshrc, based on the original file from ZDOTDIR.
According to zshall(1), zsh also reads .zshenv and .zprofile from ZDOTDIR
before .zshrc.

On NixOS / home-manager, a "$ZSH" variable is being set in .zshenv that
points to the script directory in the Nix store, which is then being
used by .zshrc. As the previous mentioned files are not being copied,
the shell is broken:

    ---
    You are now in shell mode. You can execute git commands or run checks.
    Cosmetic commit edits (reword subjects, fix trailers) are fine;
    b4 will reconcile tracking data when you return.
    Do NOT add, remove, squash, or reorder commits.
    When done, Ctrl-d to return to review UI.
    ---
    /home/sinuscosinustan/.zshrc:source:26: no such file or directory:
    /oh-my-zsh.sh
    (b4) ->  linux $(git_prompt_info)

Copy .zshenv as well as .zprofile into the temporary ZDOTDIR if they
exist to avoid a broeken shell.

Signed-off-by: Tan Siewert <tan.siewert@9elements.com>
---
 src/b4/__init__.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index d140757..c71564b 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -6339,6 +6339,13 @@ def _suspend_to_shell(
     elif shellname == 'zsh':
         real_zdotdir = os.environ.get('ZDOTDIR', os.path.expanduser('~'))
         with tempfile.TemporaryDirectory(prefix='b4-shell-') as tmpdir:
+            for zdotfile in ['.zshenv', '.zprofile']:
+                try:
+                    zfile = os.path.join(real_zdotdir, zdotfile)
+                    shutil.copy(zfile, tmpdir)
+                except FileNotFoundError:
+                    logger.debug('%s not found, ignoring', zdotfile)
+
             zshrc = os.path.join(tmpdir, '.zshrc')
             with open(zshrc, 'w') as f:
                 f.write(f'ZDOTDIR="{real_zdotdir}"\n')

---
base-commit: 1f2f768cfa57721bbc235451dbf0a777b876945f
change-id: 20260819-zshenv-c80b5520e48b

Best regards,
--
Tan Siewert <tan.siewert@9elements.com>
-- 
Tan Siewert <tan.siewert@9elements.com>

