Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794601335;
	b=hdNLhZ+E/h165XJ6tKiQztZz/NnAbotDqJDQv4+QrjjWrBZET0YuvsAllf3FjPfRr9OX
	 WKblAQWXIZF5svqVWHdzrxDM2OmzJiAjTlYpPmhYQ1uYJeVShKyUlCubXpC225YGseWQy
	 SJAZsAgpB9/bCsdLsQjGSVuurVKIz1BiHOkorJPoeeAyxanbiqcetjjxi1RLmFdML8Lxc
	 qOT2J+Hyy24ChxjL44BuEvpVQkdJ/tYU33pFMR+lN3c2hlX0JAzg9JlRf+kNMFE4d/xZn
	 AoNemMi4xYqsgTyQIZqT/ThwNpNvHgT04+Z/7cAMwSAr/66omXSekFYq/ji6qiqq4yQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601335;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=5IyOSPGSTTeWgi4EFxgnfast7IGzEgwPEV1zaOR59J8=;
	b=rZW8ERL7mfJXnzGa5HyAkbzWJhAzMzmI3wkhMoQtDmXDZ4jgPDHeJsR5IiUxLTF8rpd0
	 A53w8eZYLOgG67TTNS6LfOsvUuB3PAQ2NzZa7cPckd73VbPufiO8SwNQl5qCn7Wsw5Ref
	 CbjqZlc+XqldcuH2+Cip4Q99FDUQcl0E01kA+/ixHEfbEy/QjyefeP1cmYc0VxLTWG6ox
	 SLtXPosOCofyCt9x4SSBKXwuGOVemaE03OY8sgVxnsde+EhcGupa+4acKNPO0SFQiZjVD
	 isRF+aDcYsynzcAzMEa+aY9lYrucv56jwWWpH22161r/l4HqvXsjwCkq4Dz8B5goRxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xhvkd7EJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184F3606A88F
	for <tools@linux.kernel.org>; Fri, 13 Nov 2026 20:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xhvkd7EJ
Received: by smtp.kernel.org (Postfix)
	id 05A2A1F000CA; Fri, 13 Nov 2026 20:22:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794601334;
	b=Xfi7DA8HLslBiPURH++fszWXqMKOiI3FKoggkOGaCB3YvhG2HUMpbD4kVqKJUU6Nlh0a
	 5JPWDY3syP6NoWz5fQ2uM1jkZvFeoUofbQ1VsIlIadAQk4v0IY7TBf1//VGQasRH+TR1T
	 C+/4qyIyzE+W1glLeP1S/qKt8+sPbbe7SYzScYoMgE7/RXRvTaNRCOnblQNFOg0GmoE6L
	 13rD8/lTv2+PKSa7zLEjCgav+eY++ITSaOJMqDpOJZLRHwi4r0Ei/MPwOTkPbrT2cPTc2
	 Uelk9RRK9B6ExvL6Q7+YL9b4TTf8CNwi3fae6bZGC5twjaSY9zjrmP6A5jhx1+e8snQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794601334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=5IyOSPGSTTeWgi4EFxgnfast7IGzEgwPEV1zaOR59J8=;
	b=YmDmBhuPTZkpA1H8E6ZFu126OweQqm+dFtVSFtOuQIA2Dv5nkjkjxpDojNP7uoQqen44
	 9lQHQh5M1MQABZgPymsyVEfvQd378Mmov+JENtzqTvKlLApFa3QwiKtu530fcT6Hn1T87
	 VKn/BntlOThLxN2/RONyLXdf5KJkjDyLSJTIIJqcXghnsu7B0dlU2SbA35qPqwu62urb6
	 o1fIzPhvvC7W7gJC/JWwQhiyNxQdU3p3snnotHptkco0cbyxmV3FWLv569qp7UUG6ONEa
	 HjD1k+/1m41DKSlFou8uPEVBWleCgcclj3SqGc7G/K/fkzrRY1ez300Q9++FJRvsQ9g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xhvkd7EJ;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7340E1F000CF
	for <tools@kernel.org>; Fri, 13 Nov 2026 20:22:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xhvkd7EJ
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 7340E1F000CF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-8446af403b5so1469440a34.2
        for <tools@kernel.org>; Fri, 13 Nov 2026 12:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794601333; x=1795206133; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5IyOSPGSTTeWgi4EFxgnfast7IGzEgwPEV1zaOR59J8=;
        b=xhvkd7EJ9nmaDRVKtW+/C25E6eB6WG4iXD/+flBWnuUAmuFKJ5aZc7SpjZdjfnDWC6
         Zzujj1LXo+BGmtwnxbbXpHjGIrFOrloMr/ibsbW3bTd5qN83YhlOTvUB/uA6dXJozyGs
         Z6GoJarqM9AafovzqnDp4Y2GMqbTY4EzWQfO6IP9978PxlM2w4U/82ifztYw3sZtOZty
         yJZ3WsuSZJ+Pu/k95QdzpUEwXNCoSsdu17ckHWAClRtOjnCBPcgI0iZ1A0EAbLL2gUU9
         +C1TS9NdApDIWa0ALi5h3zRQQJFYuYSDxeoOofVkxWZbpdwt38YQPM379jpyHWcm0rpv
         4N5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601333; x=1795206133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5IyOSPGSTTeWgi4EFxgnfast7IGzEgwPEV1zaOR59J8=;
        b=0HdOUNNdRN4iYdV7xMYVBNp9jaAOkuNiy4eGebunKMMMx3XTAUZC64kpGjfNQmtGjW
         ktW84nGZZymLNZJOFHkBXMl7LgJ/pZ7o8h+pIbi59hC1Kiqa3AX6V3lWKYg5lcRD9v7l
         kgNxWbmI9qgJseF3ZH3RGyslzNhaptLPCtcm+ocEUuI0QB0+fiaNa2THXL0GLVpVj/9D
         fNBu9408ej7E+Sxl9NrsnAu0tDnYUFLbXn//sVs3Gr35IyFeinfw1XP41XnqnzOaWPF6
         p21piXQ0UXoGlv9M8WQ5cKfNuKHKzvKLbix/EhU4UJlM2hasanH4clpr9wpClfkiEvTz
         KdCg==
X-Gm-Message-State: APuU4Z+XOStPmqc8ZKyt2kxvredE0FQg1wJicgB6WxfuK22en53m5L3C
	XFaz+IpB1gRXS7XCkrIy4tQVtThCKMK0P87smbHdI/UO/Td0zx98r7dt
X-Gm-Gg: AYBFou1TY0gcU0025uGnvqogXZb8eUxZoTI0Y38OUuV/X7XpwSGNzkgnzZUfy9fjnaG
	xkwWHPivjeoLwIXZB3uhjt+ZeqXC91J7FB8AWUe2BUcLTBarYDaJ/omNtGIuYkvQQPqz/di0v5j
	xpj6EVModzlk/1GoZ8ERsg/msKOp9wKzyGIDdL+BeFq2pH0+p6kuNvlCkMniKh+AjUh7iudjEzy
	h7jHCqwEYfJq+KRK4p3zQx/LAwuWh7Vcmqd0RhSiEDsqczJy0P1AnbbUWO9c+1bt3jJdWWu5Sey
	7JVx0rj8wOezTj2gyBbH9lY/6e3pp+2l8ZSZvsDHp8gOhjA82tdMi/Jiyb3tlGCbVx9x/GM++cf
	Hj+690HdtSVWQYNGgJtZWLToAvl32K3BmjuTBDlU7riNmf3Jbiochps2YAWdorsQiro0JwVMiEo
	1BWftKkXVeFmGVkRPHKrUYWPw1tN4lXgrQAnbs1Nl34h/3ysChykE2tUPUzUrq4v9u8nj8AT6yA
	11xJ3fusm+LFWbI9j8JhruNwnB/bLLUSKsG0yBVz4FGHpF5/YLJ1KlAx9iMJwctiV2KbbU07d+/
	ekJx4jzVOG8+FLM1u/kEpWhDu32mZE7LIvoqEekobT+dZPF8sJE+SBXeYBF4y//QL31Yg/wqbKZ
	x9cryHGCJcEcGpWwy47WOBfhUMBCtYGpcrZEtHhhKHELL/903NRynxb2kTnZZJM8BBWbrN8ZJiH
	5D5NRWwT1ZYgmexvj6DV61CMwtsclcrfvl4evzI1rPMlsM8bpNcfFaubzfiHtR2gQ0hAKbkzIqf
	Q==
X-Received: by 2002:a05:6830:4104:b0:81a:9522:f007 with SMTP id 46e09a7af769-86289811e24mr3654442a34.5.1794601333266;
        Fri, 13 Nov 2026 12:22:13 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862880e98ebsm3585809a34.12.2026.11.13.12.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:22:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 13:02:15 -0700
Subject: [PATCH b4 2/5] send: separate message preparation from delivery
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
Message-Id: <20261113-submit-b4-send-resume-v1-v1-2-af325aad1179@gmail.com>
References: <20261113-submit-b4-send-resume-v1-v1-0-af325aad1179@gmail.com>
In-Reply-To: <20261113-submit-b4-send-resume-v1-v1-0-af325aad1179@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Gabriel Goller <g.goller@proxmox.com>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Extract message serialization, signing and recipient selection into
prepare_mail(). Return the prepared bytes, envelope recipients and subject
so delivery code can consume the batch without rebuilding the messages.

Keep send_mail() using the same preparation path for SMTP, local commands,
web submissions and dry runs. All messages are still signed before opening
the transport connection.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 src/b4/__init__.py | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index a89d260..8d16d0c 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -6486,17 +6486,15 @@ def patchwork_set_state(msgids: List[str], state: str) -> None:
                 logger.debug('Patchwork REST error: %s', ex)
 
 
-def send_mail(
-    smtp: Union[SMTPConnector, smtplib.SMTP, smtplib.SMTP_SSL, List[str], None],
+def prepare_mail(
     msgs: Sequence[EmailMessage],
-    fromaddr: Optional[str],
     destaddrs: Optional[Union[Set[str], List[str]]] = None,
     patatt_sign: bool = False,
     dryrun: bool = False,
     output_dir: Optional[str] = None,
     web_endpoint: Optional[str] = None,
-    reflect: bool = False,
-) -> Optional[int]:
+) -> List[Tuple[Set[str], bytes, LoreSubject]]:
+    """Render and sign the complete batch before opening a mail transport."""
     tosend: List[Tuple[Set[str], bytes, LoreSubject]] = list()
     if output_dir is not None:
         dryrun = True
@@ -6561,6 +6559,28 @@ def send_mail(
 
         tosend.append((myaddrs, bdata, ls))
 
+    return tosend
+
+
+def send_mail(
+    smtp: Union[SMTPConnector, smtplib.SMTP, smtplib.SMTP_SSL, List[str], None],
+    msgs: Sequence[EmailMessage],
+    fromaddr: Optional[str],
+    destaddrs: Optional[Union[Set[str], List[str]]] = None,
+    patatt_sign: bool = False,
+    dryrun: bool = False,
+    output_dir: Optional[str] = None,
+    web_endpoint: Optional[str] = None,
+    reflect: bool = False,
+) -> Optional[int]:
+    tosend = prepare_mail(
+        msgs,
+        destaddrs=destaddrs,
+        patatt_sign=patatt_sign,
+        dryrun=dryrun,
+        output_dir=output_dir,
+        web_endpoint=web_endpoint,
+    )
     if not len(tosend):
         return 0
 

-- 
2.53.0

