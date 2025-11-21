import qrcode
import io
import base64

# Function to generate a QR code image from given data.
# It returns the QR code as a base64 encoded PNG string.
def generate_qr(data):
    qr_img = qrcode.make(data) # Create QR code instance
    buffer = io.BytesIO() # Create an in-memory binary stream
    qr_img.save(buffer, format="PNG") # Save QR code to the buffer as PNG
    return base64.b64encode(buffer.getvalue()).decode() # Encode the image to base64 and return as string
